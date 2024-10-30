//
//  ForgotPasswordView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//

import UIKit

final class ForgotPasswordView: View {
    
    enum Action {
        case back
        case next
        case emailText(String)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    var viewModel: ForgotPassword.ViewModel? {
        didSet {
            emailInput.text = viewModel?.emailVievModel
            nextPageButton.isEnabled = viewModel?.isNextEnable ?? false
        }
    }
    
    private lazy var headerView: EnterHeaderView = {
        let view = EnterHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Забыли пароль?", textSubTitle: "Введите адрес электронной почты")
        view.actionHandler = { _ in
            self.actionHandler(.back)
        }
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emailInput])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 36
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
                self.actionHandler(.emailText(text))
            }
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
    
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(stackView)
        addSubview(nextPageButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 49.5).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 41).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -41).isActive = true
        
        nextPageButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 153).isActive = true
        nextPageButton.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        
    }
}
