//
//  ConstructorImageView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.10.2021.
//
import UIKit

class ConstructorImageView: View {
    
    var coffeeImage: String? {
        didSet {
            coffeImage.image = UIImage(named: coffeeImage ?? "ConstructorCapucino")
        }
    }
    
    private let coffeImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        layer.cornerRadius = 12
        addSubview(coffeImage)
    }

    override func setupLayout() {
        super.setupLayout()
        
        heightAnchor ~= 146

        coffeImage.centerXAnchor ~= centerXAnchor
        coffeImage.centerYAnchor ~= centerYAnchor
        coffeImage.heightAnchor ~= 120
    }
}
