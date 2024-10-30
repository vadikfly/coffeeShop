//
//  IconButton.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//

import UIKit

class UserInfoInputContentView: UIView {
    
    enum Action {
        case secureButton
        case text(String)
    }

    var actionHandler: (Action) -> Void = {_ in }

    struct Model {
        var iconImage: String?
        var placeholderText: String?
        var eyeIconHidden: Bool?
        var secureText: Bool?
    }
    
    var viewModel: Model = .init() {
        didSet {
            if let iconImage = viewModel.iconImage {
                iconView.image = UIImage(named: iconImage)
            }
            else {
                iconView.image = nil
            }
            itemTextField.placeholder = viewModel.placeholderText ?? "Введите ваш текст"
            buttonEye.isHidden = viewModel.eyeIconHidden ?? true
        }
    }

    var secureText: Bool? {
        didSet{
            itemTextField.isSecureTextEntry = secureText ?? false
            if itemTextField.isSecureTextEntry {
                self.buttonEye.setImage(UIImage(systemName: "eye.slash")?.withTintColor(UIColor(red: 0, green: 0.09, blue: 0.19, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
            }
            else {
                self.buttonEye.setImage(UIImage(systemName: "eye")?.withTintColor(UIColor(red: 0, green: 0.09, blue: 0.19, alpha: 1), renderingMode: .alwaysOriginal), for: .normal)
            }
        }
    }

    var text: String? {
        didSet {
            itemTextField.text = text
        }
    }
    
    private let iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Message")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.widthAnchor.constraint(equalToConstant: 18).isActive = true
        view.heightAnchor.constraint(equalToConstant: 18).isActive = true
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var itemTextField: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = UIFont(name: "Poppins-Medium", size: 12)
        view.textColor = #colorLiteral(red: 0, green: 0.09227422625, blue: 0.2038781643, alpha: 1)

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
        return view
    }()
    
    private lazy var buttonEye: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(UIImage(named: "Show"), for: .normal)
        view.isHidden = false
        view.contentMode = .scaleAspectFit
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.secureButton)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    let gorizontalSeparator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let verticalSeparator: SeparatorView = {
        let view = SeparatorView(width: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupContent()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        backgroundColor = .white
    }
    
    func setupContent() {
        addSubview(iconView)
        addSubview(verticalSeparator)
        addSubview(itemTextField)
        addSubview(gorizontalSeparator)
        addSubview(buttonEye)
        
    }
    
    func setupLayout() {
        
        gorizontalSeparator.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        gorizontalSeparator.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        gorizontalSeparator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        iconView.leftAnchor.constraint(equalTo: gorizontalSeparator.leftAnchor, constant: 10).isActive = true
        iconView.bottomAnchor.constraint(equalTo: gorizontalSeparator.topAnchor, constant: -11).isActive = true
        iconView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        verticalSeparator.bottomAnchor.constraint(equalTo: gorizontalSeparator.topAnchor, constant: -3.5).isActive = true
        verticalSeparator.leftAnchor.constraint(equalTo: iconView.rightAnchor, constant: 10).isActive = true
        verticalSeparator.topAnchor.constraint(equalTo: iconView.topAnchor, constant: -3.5).isActive = true
        
        itemTextField.leftAnchor.constraint(equalTo: verticalSeparator.rightAnchor, constant: 19).isActive = true
        itemTextField.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
        
        buttonEye.leftAnchor.constraint(equalTo: itemTextField.rightAnchor, constant: 19).isActive = true
        buttonEye.rightAnchor.constraint(equalTo: gorizontalSeparator.rightAnchor, constant: -7).isActive = true
        buttonEye.centerYAnchor.constraint(equalTo: iconView.centerYAnchor).isActive = true
    }
}


