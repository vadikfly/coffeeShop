//
//  MyOrderFooterView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.10.2021.
//

import UIKit

class MyOrderFooterView: View {
    
    var price: String? {
        didSet {
            priceLabel.viewModel = .init(text: price, textColor: .black)
        }
    }
    
    var image: String? {
        didSet {
            imageInButton.image = UIImage(named: image ?? "")
        }
    }
    
    var title: String? {
        didSet {
            textInButton.viewModel = .init(text: title, textAlignment: .center, textColor: .white)
        }
    }
    
    enum Action {
        case next
    }
    var actionHandler: (Action) -> Void = { _ in }

    
    private var titleLabel: Label = {
        let label = Label(size: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.viewModel = .init(text: "Итоговая сумма", textColor: .gray)
        label.heightAnchor ~= 18
        return label
    }()
    
    private var priceLabel: Label = {
        let label = Label(size: 22, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor ~= 23
        return label
    }()
    
    private lazy var nextButton: UIControl = {
        let button = UIControl()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        button.layer.cornerRadius = 26
        button.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.next)
                }
            ),
            for: .touchUpInside
        )
        button.addAction(.init(handler: { _ in
            button.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.8)
        }), for: .touchDown)
        button.addAction(.init(handler: { _ in
            button.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        }), for: .touchUpInside)
        button.addAction(.init(handler: { _ in
            button.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        }), for: .touchUpOutside)
        return button
    }()
    
    private var imageInButton: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Cart")
        image.tintColor = .white
        image.setContentHuggingPriority(.required, for: .horizontal)
        image.setContentCompressionResistancePriority(.required, for: .horizontal)
        return image
    }()
    
    private var textInButton: Label = {
        let label = Label(size: 14, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.viewModel = .init(text: "Далее", textAlignment: .center, textColor: .white)
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(priceLabel)
        addSubview(nextButton)
        addSubview(imageInButton)
        addSubview(textInButton)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        nextButton.heightAnchor ~= 52
        nextButton.widthAnchor ~= 162
        nextButton.topAnchor ~= topAnchor
        nextButton.rightAnchor ~= rightAnchor - 27
        nextButton.bottomAnchor ~= bottomAnchor
        
        titleLabel.topAnchor ~= topAnchor + 2
        titleLabel.leftAnchor ~= leftAnchor + 33
        titleLabel.rightAnchor ~= nextButton.leftAnchor
        
        priceLabel.leftAnchor ~= leftAnchor + 33
        priceLabel.rightAnchor ~= nextButton.rightAnchor
        priceLabel.bottomAnchor ~= bottomAnchor - 2
        
        imageInButton.leftAnchor ~= nextButton.leftAnchor + 30
        imageInButton.centerYAnchor ~= nextButton.centerYAnchor
        
        textInButton.leftAnchor ~= imageInButton.rightAnchor + 8
        textInButton.rightAnchor ~= nextButton.rightAnchor - 26
        textInButton.centerYAnchor ~= nextButton.centerYAnchor
    }
}

