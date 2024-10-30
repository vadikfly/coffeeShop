//
//  TwoFactorVerificationViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class TwoFactorVerificationViewController: UIViewController {
    var interactor: TwoFactorVerificationBusinessLogic?
    var router: TwoFactorVerificationRoutingLogic?

    private lazy var rootView = TwoFactorVerificationView()

    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .back:
                self.interactor?.request(TwoFactorVerification.Close.Request())
            case .next:
                self.interactor?.request(TwoFactorVerification.Next.Request())
            case .password(let password):
                self.interactor?.request(TwoFactorVerification.EnterPassword.Request(password: password))
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor?.request(TwoFactorVerification.Fetch.Request())
    }
}

extension TwoFactorVerificationViewController: TwoFactorVerificationDisplayLogic {
    func display(_ viewModel: TwoFactorVerification.Fetch.ViewModel) {
        rootView.viewModel = viewModel.model
    }
    
    func display(_ viewModel: TwoFactorVerification.Close.ViewModel) {
        router?.close()
    }
    
    func display(_ viewModel: TwoFactorVerification.Next.ViewModel) {
        router?.next()
    }
    
    func display(_ viewModel: TwoFactorVerification.EnterPassword.ViewModel) {
        rootView.viewModel = viewModel.model
    }
}
