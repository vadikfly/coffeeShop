//
//  RegistrationViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RegistrationViewController: UIViewController {
    var interactor: RegistrationBusinessLogic?
    var router: RegistrationRoutingLogic?

    private lazy var rootView = RegistrationView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .back:
                self.interactor?.request(Registration.Back.Request())
            case .conditions:
                break
            case .login:
                self.interactor?.request(Registration.Login.Request())
            case .hiddenPassword:
                self.interactor?.request(Registration.ShowHidePassword.Request())
            case .next:
                self.interactor?.request(Registration.Next.Request())
                
            case .userName(let text):
                self.interactor?.request(Registration.EnterUserName.Request(userName: text))
                
            case .phoneNumber(let text):
                self.interactor?.request(Registration.EnterPhoneNumber.Request(phoneText: text))
                
            case .emailText(let text):
                self.interactor?.request(Registration.EnterEMail.Request(emailText: text))
                
            case .passwordText(let text):
                self.interactor?.request(Registration.EnterPassword.Request(passwordText: text))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.request(Registration.Fetch.Request())
    }
}

extension RegistrationViewController: RegistrationDisplayLogic {


    func display(_ viewModel: Registration.Fetch.ViewModel) {
        rootView.viewModel = viewModel.model
        if let error = viewModel.error {
            print("случилась ошибка \(error)")
        }
    }

    func display(_ viewModel: Registration.EnterUserName.ViewModel) {
        rootView.viewModel = viewModel.model
    }

    func display(_ viewModel: Registration.EnterPhoneNumber.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: Registration.EnterEMail.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: Registration.EnterPassword.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: Registration.Login.ViewModel) {
        router?.login()
    }
    
    func display(_ viewModel: Registration.Next.ViewModel) {
        router?.next()
    }
    
    func display(_ viewModel: Registration.Back.ViewModel) {
        router?.back()
    }
    func display(_ viewModel: Registration.ShowHidePassword.ViewModel) {
        rootView.viewModel = viewModel.model
    }
}
