//
//  AuthViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class AuthViewController: UIViewController {
    var interactor: AuthBusinessLogic?
    var router: AuthRoutingLogic?

    private lazy var rootView = AuthView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .back:
                self.interactor?.request(Auth.Back.Request())
            case .forgotPassword:
                self.interactor?.request(Auth.ForgotPassword.Request())
            case .registration:
                self.interactor?.request(Auth.Registration.Request())
            case .hiddenPassword:
                self.interactor?.request(Auth.ShowPassword.Request())
            case .next:
                self.interactor?.request(Auth.Next.Request())
            case .loginText(let email):
                self.interactor?.request(Auth.EnterAdress.Request(adress: email))
            case .passwordText(let password):
                self.interactor?.request(Auth.EnterPassword.Request(password: password))
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.request(Auth.Fetch.Request())
    }
}


extension AuthViewController: AuthDisplayLogic {
    func display(_ viewModel: Auth.Fetch.ViewModel) {
        rootView.viewModel = viewModel.model

        if let error = viewModel.error {
            print("случилась ошибка \(error)")
        }
    }
    
    func display(_ viewModel: Auth.Back.ViewModel) {
        router?.back()
    }
    
    func display(_ viewModel: Auth.EnterAdress.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: Auth.EnterPassword.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: Auth.ShowPassword.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: Auth.ForgotPassword.ViewModel) {
        router?.forgotPassword()
    }
    
    func display(_ viewModel: Auth.Next.ViewModel) {
        router?.next()
    }
    
    func display(_ viewModel: Auth.Registration.ViewModel) {
        router?.registration()
    }
    
    
}
