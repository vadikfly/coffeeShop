//
//  TwoFactorVerificationInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class TwoFactorVerificationInteractor {
    private let presenter: TwoFactorVerificationPresentationLogic
    private let worker: TwoFactorVerificationWorkingLogic
    
    private var model: TwoFactorVerification.Model?
    private var password: String = ""

    init(presenter: TwoFactorVerificationPresentationLogic, worker: TwoFactorVerificationWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
    
    private func canContinue() -> Bool {
        return !self.password.isEmpty
    }
}

extension TwoFactorVerificationInteractor: TwoFactorVerificationBusinessLogic {
    func request(_ request: TwoFactorVerification.Fetch.Request) {
        worker.fetch { result in
            switch result {
            case .success(let model):
                self.model = model
                self.password = model.password ?? ""
                self.presenter.present(TwoFactorVerification.Fetch.Response(model: model, canContinue: self.canContinue()))
            case .failure(let error):
                self.presenter.present(TwoFactorVerification.Fetch.Response(error: error, canContinue: false))
            }
        }
    }
    
    func request(_ request: TwoFactorVerification.Close.Request) {
        presenter.present(TwoFactorVerification.Close.Response())
    }
    
    func request(_ request: TwoFactorVerification.Next.Request) {
        presenter.present(TwoFactorVerification.Next.Response())
    }
    
    func request(_ request: TwoFactorVerification.EnterPassword.Request) {
        self.password = request.password
        presenter.present(
            TwoFactorVerification.EnterPassword.Response(
                password: self.password,
                canContinue: self.canContinue()
            )
        )
    }
}

extension TwoFactorVerificationInteractor: TwoFactorVerificationDataStore {}
