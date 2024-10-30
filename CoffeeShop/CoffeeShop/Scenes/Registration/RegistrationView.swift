//
//  RegistrationView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//

import UIKit

final class RegistrationView: View {
    
    enum Action {
        case back
        case conditions
        case login
        case hiddenPassword
        case next
        case userName(String)
        case phoneNumber(String)
        case emailText(String)
        case passwordText(String)
    }
    var actionHandler: (Action) -> Void = { _ in }

    var viewModel: Registration.ViewModel? {
        didSet {
            nameUserInput.text = viewModel?.name
            numberPhoneInput.text = viewModel?.phone
            emailInput.text = viewModel?.email
            passInput.text = viewModel?.password
            nextPageButton.isEnabled = viewModel?.isNextEnable ?? false
            passInput.secureText = viewModel?.showPassword
        }
    }
    
    private lazy var headerView: EnterHeaderView = {
        let view = EnterHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Зарегистрироваться", textSubTitle: "Создать аккаунт здесь")
        view.actionHandler = { _ in
            self.actionHandler(.back)
        }
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameUserInput, numberPhoneInput, emailInput, passInput])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 35
        return view
    }()
    
    private lazy var nameUserInput: UserInfoInputContentView = {
        let view = UserInfoInputContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconImage: "Profile", placeholderText: "Имя пользователя")
        view.actionHandler = { action in
            switch action {
            case .secureButton:
                break
            case .text(let text):
                self.actionHandler(.userName(text))
            }
        }
        return view
    }()
    
    private lazy var numberPhoneInput: UserInfoInputContentView = {
        let view = UserInfoInputContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconImage: "Smartphone", placeholderText: "Номер мобильного телефона")
        view.actionHandler = { action in
            switch action {
            case .secureButton:
                break
            case .text(let text):
                self.actionHandler(.phoneNumber(text))
            }
        }
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
    
    private lazy var passInput: UserInfoInputContentView = {
        let view = UserInfoInputContentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconImage: "Lock", placeholderText: "Пароль", eyeIconHidden: false, secureText: true)
//        view.itemTextField.isSecureTextEntry = true
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
    
    private lazy var conditionsButton: TextButton = {
        let view = TextButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Регистрируясь, вы соглашаетесь с нашими условиями использования", textSize: 12)
        view.actionHandler = {
            self.actionHandler(.conditions)
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
        view.viewModel = .init(text: "Уже зарегистрировались?", textColor: .gray)
        return view
    }()
    
    private lazy var enterButton: TextButton = {
        let view = TextButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Войти.")
        view.actionHandler = {
            self.actionHandler(.login)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(stackView)
        addSubview(conditionsButton)
        addSubview(nextPageButton)
        addSubview(registrationLabel)
        addSubview(enterButton)
        
    }
    
    override func setupLayout() {
        super.setupLayout()
        //        headerView.pinToSuperview()
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 49).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 41).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -41).isActive = true
        
        conditionsButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 29).isActive = true
        conditionsButton.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        conditionsButton.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
        conditionsButton.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        
        nextPageButton.topAnchor.constraint(equalTo: conditionsButton.bottomAnchor, constant: 27).isActive = true
        nextPageButton.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        
        registrationLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -42).isActive = true
        registrationLabel.leftAnchor.constraint(equalTo: stackView.leftAnchor).isActive = true
        
        enterButton.leftAnchor.constraint(equalTo: registrationLabel.rightAnchor, constant: 5).isActive = true
        enterButton.centerYAnchor.constraint(equalTo: registrationLabel.centerYAnchor).isActive = true
    }
}
