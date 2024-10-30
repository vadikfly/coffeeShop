//
//  ConstructorFooterView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.10.2021.
//

import UIKit

class ConstructorFooterView: View {
    
    var price: String? {
        didSet {
            priceLabel.viewModel = .init(text: price, textAlignment: .right, textColor: .darkBlue)
        }
    }
    
    enum Action {
        case next
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private var titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Итоговая сумма", textAlignment: .left, textColor: .darkBlue)
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()

    private var priceLabel: Label = {
        let view = Label(size: 16, weight: .semibold)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()
    
    private lazy var nextButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Далее", textSize: 14, textColor: .white, cornerRadius: 23, colorButton: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1), highlightedColor: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.95))
        view.actionHandler = {
            self.actionHandler(.next)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(nextButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        nextButton.bottomAnchor ~= bottomAnchor
        nextButton.leftAnchor ~= leftAnchor
        nextButton.rightAnchor ~= rightAnchor
        nextButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
        
        titleLabel.bottomAnchor ~= nextButton.topAnchor - 10
        titleLabel.leftAnchor ~= leftAnchor
        titleLabel.rightAnchor ~= priceLabel.leftAnchor
        titleLabel.topAnchor ~= topAnchor
        
        priceLabel.rightAnchor ~= rightAnchor
        priceLabel.centerYAnchor ~= titleLabel.centerYAnchor
    }
}

