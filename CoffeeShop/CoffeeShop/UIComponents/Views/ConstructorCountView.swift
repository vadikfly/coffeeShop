//
//  ConstructorCountView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.10.2021.
//

import UIKit

class ConstructorCountView: View {
    
    enum Action {
        case minus
        case plus
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    var coffeeCount: String = "1" {
        didSet {
            countView.coffeeCount = coffeeCount
        }
    }
    
    var coffeeName: String? {
        didSet {
            titleLabel.viewModel.text = coffeeName
        }
    }
    
    private let titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private lazy var countView: QuantityView = {
        let view = QuantityView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .minus:
                self.actionHandler(.minus)
            case .plus:
                self.actionHandler(.plus)
            }
        }
        return view
    }()
    
    private let separator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = UIColor(red: 0.957, green: 0.961, blue: 0.969, alpha: 1)
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(countView)
        addSubview(separator)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        titleLabel.leftAnchor ~= leftAnchor + 10
        titleLabel.rightAnchor ~= countView.leftAnchor
        titleLabel.centerYAnchor ~= countView.centerYAnchor
        
        countView.topAnchor ~= topAnchor
        countView.rightAnchor ~= rightAnchor - 23
        countView.bottomAnchor ~= separator.topAnchor - 16
        
        separator.leftAnchor ~= leftAnchor + 7
        separator.rightAnchor ~= rightAnchor - 7
        separator.bottomAnchor ~= bottomAnchor
    }
}

