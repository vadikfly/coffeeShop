//
//  ProfileView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class ProfileView: View {
    
    var viewModel: Profile.RootViewModel = .init(
        profile: .init(
            name: "",
            phoneNumber: "",
            email: "",
            adress: ""
        ),
        shopAddress: []
    ) {
        didSet {
            nameView.text = viewModel.profile.name
            phoneView.text = viewModel.profile.phoneNumber
            emailView.text = viewModel.profile.email
            adressView.address = viewModel.profile.adress
        }
    }
    
    var editingViewModel: Profile.FieldsEditing = .init(
            name: false,
            phone: false,
            email: false
    ) {
        didSet {
            nameView.isEditing = editingViewModel.name
            phoneView.isEditing = editingViewModel.phone
            emailView.isEditing = editingViewModel.email
        }
    }
    
    enum text {
        case name(String)
        case phone(String)
        case email(String)
    }
    
    enum editing {
        case name
        case phone
        case email
        case address
    }
    
    enum Action {
        case close
        case text(text)
        case edit(editing)
        case editEnd
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.close)
                }
            ),
            for: .touchUpInside
        )
        view.configuration = UIButton.Configuration.plain()
        view.configurationUpdateHandler = { button in
            if button.isHighlighted {
                button.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 0.8)
                var config = button.configuration
                config?.image = UIImage(
                    named: "arrowLeft"
                )
                button.configuration = config
            }
            else {
                button.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
                var config = button.configuration
                config?.image = UIImage(
                    named: "arrowLeft"
                )
                button.configuration = config
            }
        }
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Профиль", textColor: .darkBlue)
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameView, phoneView, emailView, adressView])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillEqually
        view.spacing = 26
        return view
    }()
    
    private lazy var nameView: ProfileItemView = {
        let view = ProfileItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(icon: "ProfileName", title: "Имя")
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.text(.name(text)))
            case .edit:
                self.actionHandler(.edit(.name))
            case .editEnd:
                self.actionHandler(.editEnd)
            }
        }
        return view
    }()
    
    private lazy var phoneView: ProfileItemView = {
        let view = ProfileItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(icon: "ProfilePhone", title: "Номер телефона")
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.text(.phone(text)))
            case .edit:
                self.actionHandler(.edit(.phone))
            case .editEnd:
                self.actionHandler(.editEnd)
            }
        }
        return view
    }()
    
    private lazy var emailView: ProfileItemView = {
        let view = ProfileItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(icon: "ProfileEmail", title: "Email")
        view.actionHandler = { action in
            switch action {
            case .text(let text):
                self.actionHandler(.text(.email(text)))
            case .edit:
                self.actionHandler(.edit(.email))
            case .editEnd:
                self.actionHandler(.editEnd)
            }
        }
        return view
    }()
    
    private lazy var adressView: ProfileItemView = {
        let view = ProfileItemView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(icon: "ProfileAdress", title: "Адрес кофейни Magic Coffee")
        view.addressEnabled = true
        view.actionHandler = { action in
            switch action {
            case .text(_):
                break
            case .edit:
                self.actionHandler(.edit(.address))
            case .editEnd:
                break
            }
        }
        return view
    }()
    
    private let qrImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "ProfileQRCode")
        view.tintColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(qrImage)
    }

    override func setupLayout() {
        super.setupLayout()
        
        backButton.topAnchor ~= safeAreaLayoutGuide.topAnchor + 7
        backButton.leftAnchor ~= safeAreaLayoutGuide.leftAnchor + 13
        
        titleLabel.centerYAnchor ~= backButton.centerYAnchor
        titleLabel.centerXAnchor ~= centerXAnchor
        titleLabel.heightAnchor ~= 24
        
        stackView.leftAnchor ~= leftAnchor + 33
        stackView.rightAnchor ~= rightAnchor - 33
        stackView.topAnchor ~= titleLabel.bottomAnchor + 29
        
        qrImage.topAnchor ~= stackView.bottomAnchor + 26
        qrImage.centerXAnchor ~= centerXAnchor
        qrImage.bottomAnchor <= bottomAnchor
        let bottom = qrImage.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
        
    }
}
