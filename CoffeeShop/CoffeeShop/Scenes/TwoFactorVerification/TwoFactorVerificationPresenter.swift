//
//  TwoFactorVerificationPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class TwoFactorVerificationPresenter {
    weak var view: TwoFactorVerificationDisplayLogic?

    init(view: TwoFactorVerificationDisplayLogic) {
        self.view = view
    }
}

extension TwoFactorVerificationPresenter: TwoFactorVerificationPresentationLogic {
    func present(_ response: TwoFactorVerification.Fetch.Response) {
        view?.display(
            TwoFactorVerification.Fetch.ViewModel(
                model: response.model?.viewModel(canContinue: response.canContinue) ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }
    
    func present(_ response: TwoFactorVerification.Close.Response) {
        view?.display(TwoFactorVerification.Close.ViewModel())
    }
    
    func present(_ response: TwoFactorVerification.Next.Response) {
        view?.display(TwoFactorVerification.Next.ViewModel())
    }
    
    func present(_ response: TwoFactorVerification.EnterPassword.Response) {
        view?.display(
            TwoFactorVerification.EnterPassword.ViewModel(
                model: .init(
                    password: response.password,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
}

private extension TwoFactorVerification.Model {
    func viewModel(canContinue: Bool) -> TwoFactorVerification.ViewModel {
        return .init(
            password: self.password,
            isNextEnable: canContinue
        )
    }
}

private extension TwoFactorVerification.ViewModel {
    static var empty: TwoFactorVerification.ViewModel {
        .init(
            isNextEnable: false
        )
    }
}
