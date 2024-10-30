//
//  AuthInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class AuthInteractor {
    private let presenter: AuthPresentationLogic
    private let worker: AuthWorkingLogic
    
    private var model: Auth.Model?
    
    private var adress: String = ""
    private var password: String = ""
    private var showPassword: Bool = true


    init(presenter: AuthPresentationLogic, worker: AuthWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    private func canContinue() -> Bool {
        return !self.adress.isEmpty && !self.password.isEmpty
    }
    
    private func hidePassword() -> Bool {
        return !self.showPassword
    }
}

extension AuthInteractor: AuthBusinessLogic {
    func request(_ request: Auth.Fetch.Request) {
        worker.fetch { result in
            switch result {
            case .success(let model):
                self.model = model
                self.adress = model.adress ?? ""
                self.password = model.password ?? ""
                self.presenter.present(Auth.Fetch.Response(model: model, canContinue: self.canContinue()))
            case .failure(let error):
                self.presenter.present(Auth.Fetch.Response(error: error, canContinue: false))
            }
        }
    }
    
    func request(_ request: Auth.Back.Request) {
        presenter.present(Auth.Back.Response())
    }
    
    func request(_ request: Auth.EnterAdress.Request) {
        self.adress = request.adress
        presenter.present(
            Auth.EnterAdress.Response(
                fields: .init(
                    adress: self.adress,
                    password: self.password
                ),
                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }
    
    
    func request(_ request: Auth.EnterPassword.Request) {
        self.password = request.password
        presenter.present(
            Auth.EnterPassword.Response(
                fields: .init(
                    adress: self.adress,
                    password: self.password
                ),
                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }
    
    func request(_ request: Auth.ShowPassword.Request) {
        self.showPassword = hidePassword()
        presenter.present(
            Auth.ShowPassword.Response(
                fields: .init(
                    adress: self.adress,
                    password: self.password
                ),
                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }
    
    func request(_ request: Auth.ForgotPassword.Request) {
        presenter.present(Auth.ForgotPassword.Response())
    }
    
    func request(_ request: Auth.Next.Request) {
        presenter.present(Auth.Next.Response())
        worker.login(username: self.adress, password: self.password)
    }
    
    func request(_ request: Auth.Registration.Request) {
        presenter.present(Auth.Registration.Response())
    }
    

}

extension AuthInteractor: AuthDataStore {}
