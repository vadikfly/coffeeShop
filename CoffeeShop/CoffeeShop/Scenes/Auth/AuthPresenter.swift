//
//  AuthPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class AuthPresenter {
    weak var view: AuthDisplayLogic?

    init(view: AuthDisplayLogic) {
        self.view = view
    }
}

extension AuthPresenter: AuthPresentationLogic {
    func present(_ response: Auth.Fetch.Response) {
        view?.display(
            Auth.Fetch.ViewModel(
                model: response.model?.viewModel(canContinue: response.canContinue) ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }
    
    func present(_ response: Auth.Back.Response) {
        view?.display(Auth.Back.ViewModel())
    }
    
    func present(_ response: Auth.EnterAdress.Response) {
        view?.display(
            Auth.EnterAdress.ViewModel(
                model: .init(
                    adress: response.fields.adress,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Auth.EnterPassword.Response) {
        view?.display(
            Auth.EnterPassword.ViewModel(
                model: .init(
                    adress: response.fields.adress,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Auth.ShowPassword.Response) {
        view?.display(
            Auth.ShowPassword.ViewModel(
                model: .init(
                    adress: response.fields.adress,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Auth.ForgotPassword.Response) {
        view?.display(Auth.ForgotPassword.ViewModel())
    }
    
    func present(_ response: Auth.Next.Response) {
        view?.display(Auth.Next.ViewModel())
    }
    
    func present(_ response: Auth.Registration.Response) {
        view?.display(Auth.Registration.ViewModel())
    }
    
}

private extension Auth.Model {
    func viewModel(canContinue: Bool) -> Auth.ViewModel {
        return .init(
            adress: self.adress,
            password: self.password,
            showPassword: self.showPassword,
            isNextEnable: canContinue
        )
    }
}

private extension Auth.ViewModel {
    static var empty: Auth.ViewModel {
        .init(
            showPassword: false,
            isNextEnable: false
        )
    }
}
