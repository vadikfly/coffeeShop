//
//  TwoFactorVerificationView.swift
//  CoffeeShop
//
// Created by Vadim Mukhin on 11.09.2021.
//

import UIKit

final class TwoFactorVerificationView: View {
    
    enum Action {
        case back
        case next
        case password(String)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    var viewModel: TwoFactorVerification.ViewModel? {
        didSet {
            nextPageButton.isEnabled = viewModel?.isNextEnable ?? false
        }
    }
    
    func updateTimeText(_ text: String) {
        resendLabel.viewModel = .init(text: text)
    }
    
    private lazy var headerView: EnterHeaderView = {
        let view = EnterHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Проверка", textSubTitle: "Введите код, который мы вам отправили")
        view.actionHandler = { _ in
            self.actionHandler(.back)
        }
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [firstField, secondField, thirdField, fourthField])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 22
        view.alignment = .center
        return view
    }()
    
    private lazy var firstField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        view.widthAnchor.constraint(equalToConstant: 46).isActive = true
        view.heightAnchor.constraint(equalToConstant: 61).isActive = true
        view.font = UIFont(name: "Poppins-Medium", size: 24)
        view.textAlignment = .center
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(didSendText), for: .editingDidEndOnExit)
        return view
    }()
    
    private lazy var secondField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        view.widthAnchor.constraint(equalToConstant: 46).isActive = true
        view.heightAnchor.constraint(equalToConstant: 61).isActive = true
        view.font = UIFont(name: "Poppins-Medium", size: 24)
        view.textAlignment = .center
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(didSendText), for: .editingDidEndOnExit)
        return view
    }()
    
    private lazy var thirdField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        view.widthAnchor.constraint(equalToConstant: 46).isActive = true
        view.heightAnchor.constraint(equalToConstant: 61).isActive = true
        view.font = UIFont(name: "Poppins-Medium", size: 24)
        view.textAlignment = .center
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(didSendText), for: .editingDidEndOnExit)
        return view
    }()
    
    private lazy var fourthField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        view.widthAnchor.constraint(equalToConstant: 46).isActive = true
        view.heightAnchor.constraint(equalToConstant: 61).isActive = true
        view.font = UIFont(name: "Poppins-Medium", size: 24)
        view.textAlignment = .center
        view.layer.cornerRadius = 10
        view.addTarget(self, action: #selector(didSendText), for: .editingDidEndOnExit)
        return view
    }()
    
    private var resendLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Выслать заново через 00:30", textColor: .lightGray)
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
    
    @objc func didSendText() {
        actionHandler(.password("\(firstField.text ?? "")\(secondField.text ?? "")\(thirdField.text ?? "")\(fourthField.text ?? "")"))
    }
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(stackView)
        addSubview(resendLabel)
        addSubview(nextPageButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor).isActive = true
        headerView.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor).isActive = true
        headerView.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor).isActive = true
        
        stackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 46).isActive = true
        stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 59).isActive = true
        stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -59).isActive = true
        
        resendLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 51).isActive = true
        resendLabel.centerXAnchor.constraint(equalTo: stackView.centerXAnchor).isActive = true
        
        nextPageButton.topAnchor.constraint(equalTo: resendLabel.bottomAnchor, constant: 55).isActive = true
        nextPageButton.rightAnchor.constraint(equalTo: stackView.rightAnchor).isActive = true
        
    }
}
