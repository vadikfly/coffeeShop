//
//  ForgotPasswordViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class ForgotPasswordViewController: UIViewController {
    var interactor: ForgotPasswordBusinessLogic?
    var router: ForgotPasswordRoutingLogic?
    
    private lazy var rootView = ForgotPasswordView()
    
    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .next:
                self.interactor?.request(ForgotPassword.Next.Request())
            case .back:
                self.interactor?.request(ForgotPassword.Back.Request())
            case .emailText(let text):
                self.interactor?.request(ForgotPassword.EnterEMail.Request(emailText: text))
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) { 
        super.viewWillAppear(animated)
        interactor?.request(ForgotPassword.Fetch.Request())
    }
}

extension ForgotPasswordViewController: ForgotPasswordDisplayLogic {
    func display(_ viewModel: ForgotPassword.Fetch.ViewModel) {
        rootView.viewModel = viewModel.model
        // если есть ошибка покажи ее
        if let error = viewModel.error {
            // показать ошибку
            print("случилась ошибка \(error)")
        }
    }
    
    func display(_ viewModel: ForgotPassword.EnterEMail.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: ForgotPassword.Back.ViewModel) {
        router?.back()
    }
    
    func display(_ viewModel: ForgotPassword.Next.ViewModel) {
        router?.next()
    }
}
