//
//  AuthView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class AuthView: View {
    
    enum Action {
        case back
        case forgotPassword
        case registration
        case hiddenPassword
        case next
        case loginText(String)
        case passwordText(String)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    var viewModel: Auth.ViewModel? {
        didSet{
            emailInput.text = viewModel?.adress
            passInput.text = viewModel?.password
            nextPageButton.isEnabled = viewModel?.isNextEnable ?? false
            passInput.secureText = viewModel?.showPassword
        }
    }
    
    private lazy var headerView: EnterHeaderView = {
        let view = EnterHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { _ in
            self.actionHandler(.back)
        }
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emailInput, passInput])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 34
        return view
    }()
    
    private lazy var emailInput: UserInfoInputContentView = {
        let view = UserInfoInputContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconImage: "Message", placeholderText: "Адрес электронной почты")
        view.actionHandler = { action in
            switch action {
            case .secureButton:
                break
            case .text(let text):
                self.actionHandler(.loginText(text))
            }
        }
        return view
    }()
    
    private lazy var passInput: UserInfoInputContentView = {
        let view = UserInfoInputContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconImage: "Lock", placeholderText: "Пароль", eyeIconHidden: false)
        view.actionHandler = { action in
            switch action {
            case .secureButton:
                self.actionHandler(.hiddenPassword)
            case .text(let text):
                self.actionHandler(.passwordText(text))
            }
        }
        return view
    }()
    
    private lazy var forgotPassButton: TextButton = {
        let view = TextButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Забыли пароль?")
        view.actionHandler = {
            self.actionHandler(Action.forgotPassword)  
        }
        return view
    }()
    
    private lazy var nextPageButton: IconButton = {
        let view = IconButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(systemName: "arrow.right", colorButton: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1), colorIcon: .white)
        view.actionHandler = {
            self.actionHandler(.next)
        }
        return view
    }()
    
    private var registrationLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Впервые?", textColor: .gray)
        return view
    }()
    
    private lazy var registrationButton: TextButton = {
        let view = TextButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Зарегистрироваться.")
        view.actionHandler = {
            self.actionHandler(.registration)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(stackView)
        addSubview(forgotPassButton)
        addSubview(nextPageButton)
        addSubview(registrationLabel)
        addSubview(registrationButton)
        
    }
    
    override func setupLayout() {
        super.setupLayout()
        //        headerView.pinToSuperview()
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor
        
        stackView.topAnchor ~= headerView.bottomAnchor + 51
        stackView.leftAnchor ~= leftAnchor + 41
        stackView.rightAnchor ~= rightAnchor - 41
        
        forgotPassButton.topAnchor ~= stackView.bottomAnchor + 24
        forgotPassButton.centerXAnchor ~= stackView.centerXAnchor
        
        nextPageButton.topAnchor ~= forgotPassButton.bottomAnchor + 122
        nextPageButton.rightAnchor ~= stackView.rightAnchor
        
        registrationLabel.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor - 42
        registrationLabel.leftAnchor ~= stackView.leftAnchor
        
        registrationButton.leftAnchor ~= registrationLabel.rightAnchor + 5
        registrationButton.centerYAnchor ~= registrationLabel.centerYAnchor
    }
}


