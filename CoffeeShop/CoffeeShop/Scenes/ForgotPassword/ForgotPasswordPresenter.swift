//
//  ForgotPasswordPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class ForgotPasswordPresenter {
    weak var view: ForgotPasswordDisplayLogic?

    init(view: ForgotPasswordDisplayLogic) {
        self.view = view
    }
}

extension ForgotPasswordPresenter: ForgotPasswordPresentationLogic {
    func present(_ response: ForgotPassword.Fetch.Response) {
        view?.display(
            ForgotPassword.Fetch.ViewModel(
                model: response.model?.viewModel(canContinue: response.canContinue) ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }
    
    
    func present(_ response: ForgotPassword.EnterEMail.Response) {
        view?.display(
            ForgotPassword.EnterEMail.ViewModel(
                model: .init(
                    emailVievModel: response.emailText,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: ForgotPassword.Next.Response) {
        view?.display(ForgotPassword.Next.ViewModel())
    }
    
    func present(_ response: ForgotPassword.Back.Response) {
        view?.display(ForgotPassword.Back.ViewModel())
    }
}

private extension ForgotPassword.Model {
    func viewModel(canContinue: Bool) -> ForgotPassword.ViewModel {
        .init(emailVievModel: self.email, isNextEnable: canContinue)
    }
}

private extension ForgotPassword.ViewModel {
    static var empty: ForgotPassword.ViewModel {
        .init(isNextEnable: false)
    }
}
