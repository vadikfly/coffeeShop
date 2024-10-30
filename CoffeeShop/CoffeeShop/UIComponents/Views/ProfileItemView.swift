//
//  ProfileItemView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//

import UIKit

class ProfileItemView: View {
    
    struct Model {
        var icon: String?
        var title: String?
    }
    
    var viewModel: Model = .init() {
        didSet {
            iconView.image = UIImage(named: viewModel.icon ?? "")
            titleLabel.viewModel = .init(text: viewModel.title, textColor: .gray)
        }
    }
    
    var addressEnabled: Bool? {
        didSet {
            textField.isHidden = addressEnabled ?? false
            adressLabel.isHidden = !(addressEnabled ?? false)
        }
    }
    
    var isEditing: Bool = false {
        didSet {
            backgroundTextFieldView.isHidden = !isEditing
            textField.isEnabled = isEditing
            textField.becomeFirstResponder()
        }
    }
    
    var text: String? {
        didSet {
            textField.text = text
        }
    }
    
    var address: String? {
        didSet {
            adressLabel.viewModel = .init(text: address, textColor: .darkBlue)
        }
    }
    
    enum Action {
        case text(String)
        case edit
        case editEnd
    }
    var actionHandler: (Action) -> Void = { _ in }

    private let circleView: CircleView = {
        let view = CircleView(heigth: 42, width: 42, color: UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.tintColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 10, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var adressLabel: Label = {
        let view = Label(size: 14, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Poppins-Semibold", size: 14)
        view.textColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.text(view.text ?? ""))
                }
            ),
            for: .allEditingEvents
        )
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.editEnd)
                }
            ),
            for: .editingDidEndOnExit
        )
        view.isEnabled = false
        return view
    }()
    
    private let backgroundTextFieldView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 0.8)
        view.layer.cornerRadius = 3
        view.isHidden = true
        return view
    }()
    
    private lazy var editButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.edit)
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
                    named: "ProfileEdit"
                )
                button.configuration = config
            }
            else {
                button.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
                var config = button.configuration
                config?.image = UIImage(
                    named: "ProfileEdit"
                )
                button.configuration = config
            }
        }
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(circleView)
        addSubview(iconView)
        addSubview(titleLabel)
        addSubview(backgroundTextFieldView)
        addSubview(textField)
        addSubview(adressLabel)
        addSubview(editButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        circleView.leftAnchor ~= leftAnchor
        circleView.topAnchor ~= topAnchor
        circleView.bottomAnchor ~= bottomAnchor
        
        iconView.centerXAnchor ~= circleView.centerXAnchor
        iconView.centerYAnchor ~= circleView.centerYAnchor
        
        titleLabel.leftAnchor ~= circleView.rightAnchor + 16
        titleLabel.topAnchor ~= topAnchor + 3
        titleLabel.rightAnchor <= editButton.leftAnchor
        
        textField.leftAnchor ~= titleLabel.leftAnchor
        textField.bottomAnchor ~= bottomAnchor - 3
        textField.rightAnchor ~= editButton.leftAnchor - 16
        
        adressLabel.leftAnchor ~= titleLabel.leftAnchor
        adressLabel.topAnchor ~= titleLabel.bottomAnchor + 2
        adressLabel.rightAnchor ~= editButton.leftAnchor - 5
        
        backgroundTextFieldView.leftAnchor ~= textField.leftAnchor - 3
        backgroundTextFieldView.rightAnchor ~= textField.rightAnchor + 3
        backgroundTextFieldView.topAnchor ~= textField.topAnchor
        backgroundTextFieldView.bottomAnchor ~= textField.bottomAnchor + 2
        
        editButton.centerYAnchor ~= circleView.centerYAnchor
        editButton.rightAnchor ~= rightAnchor
    }
}
