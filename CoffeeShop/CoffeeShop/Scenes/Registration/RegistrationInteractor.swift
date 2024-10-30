//
//  RegistrationInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RegistrationInteractor {
    private let presenter: RegistrationPresentationLogic
    private let worker: RegistrationWorkingLogic

    private var username: String = ""
    private var phone: String = ""
    private var email: String = ""
    private var password: String = ""
    private var showPassword = true

    init(presenter: RegistrationPresentationLogic, worker: RegistrationWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }

    private func canContinue() -> Bool {
        return self.username.count > 4 && self.username.count < 10 && !self.phone.isEmpty && !self.email.isEmpty && !self.password.isEmpty
    }
    
    private func showHidePassword() -> Bool {
        return self.showPassword ? false : true
    }
    
}

extension RegistrationInteractor: RegistrationBusinessLogic {

    func request(_ request: Registration.Fetch.Request) {
        worker.fetch { result in
            switch result {
            case .success(let model):
                self.username = model.username ?? ""
                self.phone = model.phone ?? ""
                self.email = model.email ?? ""
                self.password = model.password ?? ""
                self.presenter.present(Registration.Fetch.Response(model: model, canContinue: self.canContinue()))
            case .failure(let error):
                self.presenter.present(Registration.Fetch.Response(error: error, canContinue: false))
            }
        }
    }

    func request(_ request: Registration.EnterUserName.Request) {
        self.username = request.userName
        presenter.present(
            Registration.EnterUserName.Response(
                fields: Registration.AllFields.init(userName: username, phone: phone, email: email, password: password),
                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }

    func request(_ request: Registration.EnterPhoneNumber.Request) {
        self.phone = request.phoneText
        presenter.present(
            Registration.EnterUserName.Response(
                fields: Registration.AllFields.init(userName: username, phone: phone, email: email, password: password),

                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }
    
    func request(_ request: Registration.EnterEMail.Request) {
        self.email = request.emailText
        presenter.present(
            Registration.EnterUserName.Response(
                fields: Registration.AllFields.init(userName: username, phone: phone, email: email, password: password),

                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }
    
    func request(_ request: Registration.EnterPassword.Request) {
        self.password = request.passwordText
        presenter.present(
            Registration.EnterUserName.Response(
                fields: Registration.AllFields.init(userName: self.username, phone: self.phone, email: self.email, password: self.password),

                showPassword: self.showPassword,
                canContinue: canContinue()
            )
        )
    }
    
    
    
    
    func request(_ request: Registration.Login.Request) {
        presenter.present(Registration.Login.Response())
    }
    
    func request(_ request: Registration.Next.Request) {
        presenter.present(Registration.Next.Response())
    }

    func request(_ request: Registration.Back.Request) {
        presenter.present(Registration.Back.Response())
    }
    
    func request(_ request: Registration.ShowHidePassword.Request) {
        self.showPassword = showHidePassword()
        presenter.present(Registration.ShowHidePassword.Response( 
            fields: Registration.AllFields.init(userName: self.username, phone: self.phone, email: self.email, password: self.password),

            showPassword: self.showPassword,
            canContinue: canContinue()))
    }
}

extension RegistrationInteractor: RegistrationDataStore {}
