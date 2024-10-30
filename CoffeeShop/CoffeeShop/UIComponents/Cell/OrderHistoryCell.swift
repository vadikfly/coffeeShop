//
//  OrderHistoryCell.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 19.09.2021.
//

import UIKit

class OrderHistoryCell: UIView {
    
    enum Action {
        case buy
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    struct Model {
        let dateOrder: String?
        let coffee: String?
        let adress: String?
        let price: String?
    }

    var viewModel: Model = .init(dateOrder: nil, coffee: nil, adress: nil, price: nil) {
        didSet {
            dateLabel.viewModel = .init(text: viewModel.dateOrder ?? "", textAlignment: .left, textColor: .gray)
            coffeeLabel.viewModel = .init(text: "\(viewModel.coffee ?? "Latte")", textAlignment: .left, textColor: .black)
            locationLabel.viewModel = .init(text: "\(viewModel.adress ?? "ул. Пушкина, дом Колотушкина")", textAlignment: .left, textColor: .black)
            priceLabel.viewModel = .init(text: viewModel.price ?? "BYN 10.99", textAlignment: .center, textColor: .black)
        }
    }
    
    private let dateLabel: Label = {
        let view = Label(size: 10, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "24 июня | 12:30 | к 18:10", textAlignment: .left, textColor: .gray)
        return view
    }()
    
    private let coffeeLabel: Label = {
        let view = Label(size: 10, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Латте", textAlignment: .left, textColor: .black)
        return view
    }()
    
    private let locationLabel: Label = {
        let view = Label(size: 10, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "г. Минск, ул. Тимирязева, 67", textAlignment: .left, textColor: .black)
        view.heightAnchor.constraint(equalToConstant: 15).isActive = true
        return view
    }()
    
    private let priceLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "BYN 10.99", textAlignment: .center, textColor: .black)
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()
    
    private lazy var orderButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Заказать", textSize: 10, cornerRadius: 16, colorButton: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1))
        view.actionHandler = {
            self.actionHandler(.buy)
        }
        return view
    }()
    
    private let coffeeImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "CoffeeIcon")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let locationImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "LocationIcon")
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private var separator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = UIColor(red: 0.957, green: 0.961, blue: 0.969, alpha: 1)
        return view
    }()
    
    init() {
        super.init(frame: .zero)
        // setup
        setupView()
        setupContent()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {

    }
   
    func setupContent() {
        // add subviews
        addSubview(priceLabel)
        addSubview(orderButton)
        addSubview(dateLabel)
        addSubview(coffeeImage)
        addSubview(coffeeLabel)
        addSubview(locationImage)
        addSubview(locationLabel)
        addSubview(separator)
    }
    
    func setupLayout() {
        priceLabel.rightAnchor ~= rightAnchor
        priceLabel.topAnchor ~= topAnchor + 23
        
        orderButton.topAnchor ~= priceLabel.bottomAnchor + 5
        orderButton.leftAnchor ~= priceLabel.leftAnchor
        orderButton.heightAnchor.constraint(equalToConstant: 32).isActive = true
        orderButton.widthAnchor.constraint(equalToConstant: 76).isActive = true
        
        dateLabel.topAnchor ~= topAnchor + 23
        dateLabel.leftAnchor ~= leftAnchor
        dateLabel.rightAnchor >= priceLabel.leftAnchor
        
        coffeeImage.leftAnchor ~= leftAnchor
        coffeeImage.centerYAnchor ~= coffeeLabel.centerYAnchor
        
        coffeeLabel.topAnchor ~= dateLabel.bottomAnchor + 12
        coffeeLabel.leftAnchor ~= coffeeImage.rightAnchor + 11
        coffeeLabel.rightAnchor >= priceLabel.leftAnchor
        
        locationImage.leftAnchor ~= leftAnchor
        locationImage.centerYAnchor ~= locationLabel.centerYAnchor

        locationLabel.leftAnchor ~= locationImage.rightAnchor + 9
        locationLabel.topAnchor ~= coffeeLabel.bottomAnchor + 10
        locationLabel.bottomAnchor ~= separator.topAnchor - 11
        locationLabel.rightAnchor >= priceLabel.leftAnchor
        
        separator.leftAnchor ~= leftAnchor
        separator.rightAnchor ~= rightAnchor
        separator.bottomAnchor ~= bottomAnchor
    }
}



