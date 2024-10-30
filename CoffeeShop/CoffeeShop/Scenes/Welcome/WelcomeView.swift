//
//  WelcomeView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class WelcomeView: View {
    enum Action {
        case next
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private let logoView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        return view
    }()
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Logo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let titleLabel: Label = {
        let view = Label(size: 28, weight: .regular)
        view.viewModel = .init(text: "Почувствуй себя\nбариста!", textAlignment: .center, textColor: .black)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let subTitleLabel: Label = {
        let view = Label(size: 18, weight: .regular)
        view.viewModel = .init(text: "Волшебный кофе под заказ.", textAlignment: .center, textColor: .gray)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rectangleView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let leftRectangleView: CircleView = {
        let view = CircleView(heigth: 10, width: 33, color: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let centerRectangleView: CircleView = {
        let view = CircleView(heigth: 10, width: 10, color: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.2))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let rightRectangleView: CircleView = {
        let view = CircleView(heigth: 10, width: 10, color: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.2))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var nextButton: IconButton = {
        let view = IconButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(systemName: "arrow.right", pointSize: 24, colorButton: UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1), colorIcon: UIColor(red: 1, green: 1, blue: 1, alpha: 1))
        view.actionHandler = {
            self.actionHandler(.next)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(logoView)
        addSubview(logoImage)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(rectangleView)
        addSubview(leftRectangleView)
        addSubview(rightRectangleView)
        addSubview(centerRectangleView)
        addSubview(nextButton)
    }

    override func setupLayout() {
        super.setupLayout()

        logoView.leftAnchor ~= leftAnchor
        logoView.rightAnchor ~= rightAnchor
        logoView.topAnchor ~= safeAreaLayoutGuide.topAnchor + 55
        
        logoImage.leftAnchor ~= logoView.leftAnchor
        logoImage.rightAnchor ~= logoView.rightAnchor
        logoImage.topAnchor ~= logoView.topAnchor
        logoImage.bottomAnchor ~= logoView.bottomAnchor

        titleLabel.topAnchor ~= logoView.bottomAnchor + 28
        titleLabel.centerXAnchor ~= centerXAnchor
        titleLabel.leftAnchor ~= leftAnchor + 10
        
        subTitleLabel.topAnchor ~= titleLabel.bottomAnchor + 5
        subTitleLabel.leftAnchor ~= titleLabel.leftAnchor
        subTitleLabel.rightAnchor ~= titleLabel.rightAnchor
        
        rectangleView.topAnchor ~= subTitleLabel.bottomAnchor + 43
        rectangleView.centerXAnchor ~= centerXAnchor
        
        leftRectangleView.leftAnchor ~= rectangleView.leftAnchor
        leftRectangleView.topAnchor ~= rectangleView.topAnchor
        leftRectangleView.bottomAnchor ~= rectangleView.bottomAnchor
        
        centerRectangleView.leftAnchor ~= leftRectangleView.rightAnchor + 10
        centerRectangleView.topAnchor ~= rectangleView.topAnchor
        centerRectangleView.bottomAnchor ~= rectangleView.bottomAnchor
        
        rightRectangleView.leftAnchor ~= centerRectangleView.rightAnchor + 10
        rightRectangleView.topAnchor ~= rectangleView.topAnchor
        rightRectangleView.bottomAnchor ~= rectangleView.bottomAnchor
        rightRectangleView.rightAnchor ~= rectangleView.rightAnchor
        
        nextButton.rightAnchor ~= rightAnchor - 47
        nextButton.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor - 16
    }
}
