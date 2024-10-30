//
//  LoyaltyCardView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 15.09.2021.
//

import UIKit

class LoyaltyCardView: View {
    
    var textTitle: String? {
        didSet {
            titleLabel.viewModel = .init(text: "\(textTitle ?? "")", textColor: .lightGray)
        }
    }
    
    struct Model {
        var countText: String?
        var totalCount = 0
        var selectedCount = 0
    }
    
    var viewModel: Model = .init() {
        didSet {
            countCoffeeLabel.viewModel = .init(text: viewModel.countText, textColor: .lightGray)
            glassesStack.arrangedSubviews.forEach { subview in  
                subview.removeFromSuperview()
            }
            
            for i in 0..<viewModel.totalCount {
                let view = UIImageView()
                view.image = i < viewModel.selectedCount ? (UIImage(named: "selectedCup")) : (UIImage(named: "cup"))
                view.contentMode = .scaleAspectFit
                glassesStack.addArrangedSubview(view)
            }
        }
    }
    
    private lazy var glassesStack: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 2
        return view
    }()
    
    
    private lazy var titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var countCoffeeLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var glassView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(countCoffeeLabel)
        addSubview(glassView)
        addSubview(glassesStack)
        
        backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        layer.cornerRadius = 12
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        titleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        titleLabel.topAnchor ~= topAnchor + 14
        titleLabel.leftAnchor ~= leftAnchor + 31
        
        countCoffeeLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        countCoffeeLabel.topAnchor ~= topAnchor + 14
        countCoffeeLabel.rightAnchor ~= rightAnchor - 31
        
        glassView.topAnchor ~= titleLabel.bottomAnchor + 9
        glassView.leftAnchor ~= leftAnchor + 23
        glassView.rightAnchor ~= rightAnchor - 23
        glassView.bottomAnchor ~= bottomAnchor - 17
        
        glassesStack.leftAnchor ~= glassView.leftAnchor + 11
        glassesStack.rightAnchor ~= glassView.rightAnchor - 11
        glassesStack.topAnchor ~= glassView.topAnchor + 16
        glassesStack.bottomAnchor ~= glassView.bottomAnchor - 15
        
        
    }
}
