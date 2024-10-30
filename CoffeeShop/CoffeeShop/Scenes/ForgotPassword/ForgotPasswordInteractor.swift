//
//  ForgotPasswordInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class ForgotPasswordInteractor {
    private let presenter: ForgotPasswordPresentationLogic
    private let worker: ForgotPasswordWorkingLogic
    private var model: ForgotPassword.Model?
    private var email: String = ""
    
    init(presenter: ForgotPasswordPresentationLogic, worker: ForgotPasswordWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    private func canContinue() -> Bool {
        return self.email.count > 1 && self.email.count < 10
    }
}

extension ForgotPasswordInteractor: ForgotPasswordBusinessLogic {
    func request(_ request: ForgotPassword.Fetch.Request) {
        worker.fetch { result in
            switch result {
            case .success(let model):
                self.email = model.email ?? ""
                self.presenter.present(ForgotPassword.Fetch.Response(model: model, canContinue: self.canContinue()))
            case .failure(let error):
                self.presenter.present(ForgotPassword.Fetch.Response(error: error, canContinue: false))
            }
        }
    }
    
    func request(_ request: ForgotPassword.EnterEMail.Request) {
        self.email = request.emailText
        presenter.present(
            ForgotPassword.EnterEMail.Response(emailText: self.email, canContinue: canContinue()))
    }
    
    func request(_ request: ForgotPassword.Back.Request) {
        presenter.present(ForgotPassword.Back.Response())
    }
    
    func request(_ request: ForgotPassword.Next.Request) {
        presenter.present(ForgotPassword.Next.Response())
    }
}

extension ForgotPasswordInteractor: ForgotPasswordDataStore {}
