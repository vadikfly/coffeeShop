//
//  OrderItemCell.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 26.10.2021.
//

import UIKit

class OrderItemCell: View, SimpleContentCell {
    
    struct Model {
        var name: String
        var image: String
        var options: String
        var count: String
        var price: String
    }
    
    var viewModel: Model? = .init(
        name: "",
        image: "",
        options: "",
        count: "",
        price: ""
    ) {
        didSet {
            titleLabel.viewModel = .init(text: viewModel?.name, textAlignment: .left, textColor: .darkBlue)
            coffeeImage.image = UIImage(named: viewModel?.image ?? "")
            subTitleLabel.viewModel = .init(text: viewModel?.options, textAlignment: .left, textColor: .gray)
            countLabel.viewModel = .init(text: viewModel?.count, textColor: .gray)
            priceLabel.viewModel = .init(text: viewModel?.price, textAlignment: .center, textColor: .darkBlue)
        }
    }
    
    enum Action {
        case delete
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        view.layer.cornerRadius = 16
        
        let swipeGestureLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeLeft))
        swipeGestureLeft.direction = .left
        view.addGestureRecognizer(swipeGestureLeft)
        
        let swipeGestureRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipeRight))
        swipeGestureRight.direction = .right
        view.addGestureRecognizer(swipeGestureRight)
        
        return view
    }()

    @objc func handleSwipeLeft() {
        UIView.animate(withDuration: 1, animations: {
            self.backgroundView.transform = CGAffineTransform(translationX: -59, y: 0)
            self.coffeeImage.transform = CGAffineTransform(translationX: -59, y: 0)
            self.countLabel.transform = CGAffineTransform(translationX: -59, y: 0)
            self.titleLabel.transform = CGAffineTransform(translationX: -59, y: 0)
            self.subTitleLabel.transform = CGAffineTransform(translationX: -59, y: 0)
            self.priceLabel.transform = CGAffineTransform(translationX: -59, y: 0)
            self.backgroundDeleteView.alpha = 1
            self.deleteImage.alpha = 1
        })
    }
    
    @objc func handleSwipeRight() {
        UIView.animate(withDuration: 1, animations: {
            self.backgroundView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.coffeeImage.transform = CGAffineTransform(translationX: 0, y: 0)
            self.countLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.titleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.subTitleLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.priceLabel.transform = CGAffineTransform(translationX: 0, y: 0)
            self.backgroundDeleteView.alpha = 0
            self.deleteImage.alpha = 0
            
        })
    }

    private lazy var backgroundDeleteView: UIControl = {
        let view = UIControl()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 1, green: 0.898, blue: 0.898, alpha: 1)
        view.widthAnchor ~= 48
        view.layer.cornerRadius = 15
        view.alpha = 0
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.delete)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    private let deleteImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(named: "Delete")
        view.tintColor = .red
        view.alpha = 0
        return view
    }()
    
    private let coffeeImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.setContentHuggingPriority(.required, for: .horizontal)
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        return view
    }()
    
    private var titleLabel: Label = {
        let label = Label(size: 12, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor ~= 18
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private var subTitleLabel: Label = {
        let label = Label(size: 10, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor ~= 18
        label.setContentHuggingPriority(.defaultLow, for: .horizontal)
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private var countLabel: Label = {
        let label = Label(size: 12, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor ~= 18
        return label
    }()
    
    private var priceLabel: Label = {
        let label = Label(size: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(backgroundDeleteView)
        addSubview(deleteImage)
        
        addSubview(backgroundView)
        addSubview(coffeeImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(countLabel)
        addSubview(priceLabel)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        backgroundDeleteView.rightAnchor ~= rightAnchor - 24
        backgroundDeleteView.topAnchor ~= topAnchor + 10
        backgroundDeleteView.bottomAnchor ~= bottomAnchor - 10
        
        deleteImage.centerXAnchor ~= backgroundDeleteView.centerXAnchor
        deleteImage.centerYAnchor ~= backgroundDeleteView.centerYAnchor
        
        backgroundView.pinToSuperview(left: 24, top: 10, right: 24, bottom: 10)
        
        coffeeImage.heightAnchor ~= 60
        coffeeImage.widthAnchor ~= 82
        coffeeImage.topAnchor ~= backgroundView.topAnchor + 18
        coffeeImage.leftAnchor ~= backgroundView.leftAnchor + 10
        coffeeImage.bottomAnchor ~= backgroundView.bottomAnchor - 18
        
        titleLabel.topAnchor ~= coffeeImage.topAnchor
        titleLabel.leftAnchor ~= coffeeImage.rightAnchor + 10
        titleLabel.rightAnchor ~= priceLabel.leftAnchor
        
        subTitleLabel.topAnchor ~= titleLabel.bottomAnchor + 4
        subTitleLabel.leftAnchor ~= titleLabel.leftAnchor
        subTitleLabel.rightAnchor ~= priceLabel.leftAnchor
        
        countLabel.leftAnchor ~= titleLabel.leftAnchor
        countLabel.bottomAnchor ~= coffeeImage.bottomAnchor
        
        priceLabel.centerYAnchor ~= coffeeImage.centerYAnchor
        priceLabel.rightAnchor ~= backgroundView.rightAnchor - 20
    }
}
