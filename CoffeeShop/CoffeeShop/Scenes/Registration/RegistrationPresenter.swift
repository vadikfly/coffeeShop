//
//  RegistrationPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class RegistrationPresenter {
    weak var view: RegistrationDisplayLogic?
    
    init(view: RegistrationDisplayLogic) {
        self.view = view
    }
}

extension RegistrationPresenter: RegistrationPresentationLogic {
    
    func present(_ response: Registration.Fetch.Response) {
        view?.display(
            Registration.Fetch.ViewModel(
                model: response.model?.viewModel(canContinue: response.canContinue) ?? .empty,
                error: response.error?.localizedDescription
            )
        )
    }
    
    func present(_ response: Registration.EnterUserName.Response) {
        view?.display(
            Registration.EnterUserName.ViewModel(
                model: .init(
                    name: response.fields.userName,
                    phone: response.fields.phone,
                    email: response.fields.email,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Registration.EnterPhoneNumber.Response) {
        view?.display(
            Registration.EnterPhoneNumber.ViewModel(
                model: .init(
                    name: response.fields.userName,
                    phone: response.fields.phone,
                    email: response.fields.email,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Registration.EnterEMail.Response) {
        view?.display(
            Registration.EnterEMail.ViewModel(
                model: .init(
                    name: response.fields.userName,
                    phone: response.fields.phone,
                    email: response.fields.email,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Registration.EnterPassword.Response) {
        view?.display(
            Registration.EnterPassword.ViewModel(
                model: .init(
                    name: response.fields.userName,
                    phone: response.fields.phone,
                    email: response.fields.email,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
    func present(_ response: Registration.Login.Response) {
        view?.display(Registration.Login.ViewModel())
    }
    
    func present(_ response: Registration.Next.Response) {
        view?.display(Registration.Next.ViewModel())
    }
    
    func present(_ response: Registration.Back.Response) {
        view?.display(Registration.Back.ViewModel())
    }
    
    func present(_ response: Registration.ShowHidePassword.Response) {
        view?.display(
            Registration.ShowHidePassword.ViewModel(
                model: .init(
                    name: response.fields.userName,
                    phone: response.fields.phone,
                    email: response.fields.email,
                    password: response.fields.password,
                    showPassword: response.showPassword,
                    isNextEnable: response.canContinue
                )
            )
        )
    }
    
}

private extension Registration.Model {
    func viewModel(canContinue: Bool) -> Registration.ViewModel {
        return .init(
            name: self.username,
            phone: self.phone,
            email: self.email,
            password: self.password,
            showPassword: self.showPassword,
            isNextEnable: canContinue
        )
    }
}

private extension Registration.ViewModel {
    static var empty: Registration.ViewModel {
        .init(showPassword: true, isNextEnable: false)
    }
}
