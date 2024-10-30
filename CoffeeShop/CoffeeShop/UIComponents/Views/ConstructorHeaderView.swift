//
//  HeaderViewForEnter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.10.2021.
//

import UIKit

final class ConstructorHeaderView: View {
    
    enum Action {
        case back
        case buy
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    struct Model {
        var textTitle: String?
    }
    
    var viewModel: Model = .init() {
        didSet {
            titleLabel.viewModel.text = viewModel.textTitle
        }
    }

    var cartImageHidden: Bool? {
        didSet {
            buyButton.isHidden = cartImageHidden ?? false
        }
    }
    
    private lazy var backButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.back)
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
    
    private lazy var buyButton: UIButton = {
            let view = UIButton()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.addAction(
                UIAction(
                    handler: { _ in
                        self.actionHandler(.buy)
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
                        named: "buyMini"
                    )
                    button.configuration = config
                }
                else {
                    button.tintColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
                    var config = button.configuration
                    config?.image = UIImage(
                        named: "buyMini"
                    )
                    button.configuration = config
                }
            }
            return view
        }()
    
    private var titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "", textColor: .darkBlue)
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(buyButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        backButton.topAnchor ~= safeAreaLayoutGuide.topAnchor + 7
        backButton.leftAnchor ~= safeAreaLayoutGuide.leftAnchor + 13
        
        titleLabel.centerYAnchor ~= backButton.centerYAnchor
        titleLabel.centerXAnchor ~= centerXAnchor
        titleLabel.heightAnchor ~= 24
        titleLabel.bottomAnchor ~= bottomAnchor

        buyButton.centerYAnchor ~= titleLabel.centerYAnchor
        buyButton.rightAnchor ~= safeAreaLayoutGuide.rightAnchor - 26
        
    }
}
