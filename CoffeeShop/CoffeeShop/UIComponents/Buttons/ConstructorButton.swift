//
//  ConstructorButton.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 12.10.2021.
//

import UIKit

class ConstructorButton: UIControl {
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "ConstructorBackground")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let filterImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Filter")
        view.tintColor = .black
        view.contentMode = .scaleAspectFit
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()
    
    private let titleLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Конструктор кофемана", textAlignment: .left, textColor: .white)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private let chevronImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(
            pointSize: 13,
            weight: UIImage.SymbolWeight.light
        ))
        view.tintColor = .white
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
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
        addSubview(backgroundImage)
        addSubview(filterImage)
        addSubview(titleLabel)
        addSubview(chevronImage)
    }
    
    func setupLayout() {
        backgroundImage.pinToSuperview()
        
        filterImage.leftAnchor ~= backgroundImage.leftAnchor + 19
        filterImage.centerYAnchor ~= backgroundImage.centerYAnchor
        
        titleLabel.leftAnchor ~= filterImage.rightAnchor + 12
        titleLabel.centerYAnchor ~= backgroundImage.centerYAnchor
        
        chevronImage.leftAnchor ~= titleLabel.rightAnchor
        chevronImage.rightAnchor ~= backgroundImage.rightAnchor - 20
        chevronImage.centerYAnchor ~= backgroundImage.centerYAnchor
    }
}
