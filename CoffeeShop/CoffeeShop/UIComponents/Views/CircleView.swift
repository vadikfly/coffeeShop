//
//  Rectangle.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 10.09.2021.
//

import UIKit

class CircleView: UIView {
    
    var color: UIColor? {
        didSet {
            backgroundColor = color
        }
    }
    
    var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    init(heigth: CGFloat, width: CGFloat, color: UIColor) {
        super.init(frame: .zero)
        // setup
        setupView()
        setupContent()
        setupLayout()
        heightAnchor.constraint(equalToConstant: heigth).isActive = true
        widthAnchor.constraint(equalToConstant: width).isActive = true
        backgroundColor = color
        layer.cornerRadius = heigth / 2
    }
    private init() {
        super.init(frame: .zero)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
    
    func setupContent() {
        // add subviews
    }
    
    func setupLayout() {
        
    }
}
