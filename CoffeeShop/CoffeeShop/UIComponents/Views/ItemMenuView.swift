//
//  ItemMenuView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//

import UIKit

class ItemMenuView: View {
    
    struct Model {
        var image: String
        var text: String
    }
    
    var viewModel: Model = .init(image: "", text: "") {
        didSet {
            itemImage.image = UIImage(named: viewModel.image)
            itemLabel.viewModel = .init(text: viewModel.text, textAlignment: .center, textColor: .black)
        }
    }
    
    private let itemImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    private let itemLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init() {
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
        backgroundColor = .systemBackground
        layer.cornerRadius = 20
    }
   
    override func setupContent() {
        // add subviews
        addSubview(itemLabel)
        addSubview(itemImage)
    }
    
    override func setupLayout() {
        itemImage.pinToSuperview()
        
        itemLabel.bottomAnchor ~= bottomAnchor - 26
        itemLabel.centerXAnchor ~= centerXAnchor
        itemLabel.leftAnchor ~= leftAnchor + 5
    }
}


