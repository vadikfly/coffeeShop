//
//  QuantityView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 16.09.2021.
//

import UIKit

class QuantityView: View {
    
    var count: Int = 1
    
    enum Action {
        case minus
        case plus
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    var coffeeCount: String? {
        didSet {
            countLabel.viewModel.text = coffeeCount
        }
    }

    private lazy var countLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "1", textAlignment: .center, textColor: .none)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private lazy var minusButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("-", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.minus)
                }
            ),
            for: .touchUpInside
        )
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setTitle("+", for: .normal)
        view.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14)
        view.setTitleColor(.black, for: .normal)
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.plus)
                }
            ),
            for: .touchUpInside
        )
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 0.4).cgColor
        
        addSubview(countLabel)
        addSubview(minusButton)
        addSubview(plusButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        heightAnchor ~= 29
        widthAnchor ~= 73
        
        minusButton.topAnchor ~= topAnchor
        minusButton.leftAnchor ~= leftAnchor
        minusButton.bottomAnchor ~= bottomAnchor
        
        countLabel.centerYAnchor ~= centerYAnchor
        countLabel.centerXAnchor ~= centerXAnchor
        
        plusButton.topAnchor ~= topAnchor
        plusButton.bottomAnchor ~= bottomAnchor
        plusButton.rightAnchor ~= rightAnchor
    }
}
