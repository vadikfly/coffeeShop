//
//  BonusPointsView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 16.09.2021.
//

import UIKit

class BonusPointsView: View {
    

    var actionHandler: () -> Void = {}
    
    var textTitle: String? {
        didSet{
            titleLabel.viewModel = .init(text: textTitle, textColor: .lightGray)
        }
    }
    
    var bonusPointsCount: String? {
        didSet{
            bonusPointsCounterLabel.viewModel.text = bonusPointsCount
        }
    }
    
    
    private lazy var titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.viewModel = .init(text: "Мои баллы:", textColor: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bonusPointsCounterLabel: Label = {
        let view = Label(size: 24, weight: .medium)
        view.viewModel = .init(text: "0", textColor: .lightGray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var coffeeGrainImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "coffeeGrain")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private lazy var payButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Оплатить баллами", textSize: 10, cornerRadius: 5, colorButton: UIColor(red: 0.635, green: 0.806, blue: 0.913, alpha: 0.19), highlightedColor: UIColor(red: 0.635, green: 0.806, blue: 0.913, alpha: 0.27))
        view.actionHandler = {
            self.actionHandler()
        }
        return view
    }()
    
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(bonusPointsCounterLabel)
        addSubview(coffeeGrainImage)
        addSubview(payButton)
        
        backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        layer.cornerRadius = 12
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        titleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        titleLabel.topAnchor ~= topAnchor + 25
        titleLabel.leftAnchor ~= leftAnchor + 31
        
        bonusPointsCounterLabel.heightAnchor.constraint(equalToConstant: 36).isActive = true
        bonusPointsCounterLabel.topAnchor ~= titleLabel.bottomAnchor + 1
        bonusPointsCounterLabel.leftAnchor ~= leftAnchor + 31
        
        coffeeGrainImage.rightAnchor ~= rightAnchor + 10
        coffeeGrainImage.bottomAnchor ~= bottomAnchor + 24
        
        payButton.topAnchor ~= topAnchor + 45
        payButton.rightAnchor ~= rightAnchor - 25
        payButton.bottomAnchor ~= bottomAnchor - 35
        payButton.heightAnchor.constraint(equalToConstant: 28).isActive = true
        payButton.widthAnchor.constraint(equalToConstant: 111).isActive = true
        
    }
}
