//
//  StartupScreenView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class StartupScreenView: View {
    
    private let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "background")
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let logoImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.image = UIImage(named: "Logo")
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(backgroundImage)
        addSubview(logoImage)
    }

    override func setupLayout() {
        super.setupLayout()
        
        backgroundImage.pinToSuperview()
        
        logoImage.topAnchor ~= safeAreaLayoutGuide.topAnchor + 55
        logoImage.leftAnchor ~= leftAnchor
        logoImage.rightAnchor ~= rightAnchor
        
    }
}
