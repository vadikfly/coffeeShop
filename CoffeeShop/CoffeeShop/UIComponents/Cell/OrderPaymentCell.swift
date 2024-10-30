//
//  OrderPaymentCell.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 30.10.2021.
//

import UIKit

class OrderPaymentCell: View, SimpleContentCell {
    
    struct Model {
        var title: String?
        var subTitle: String?
        var image: [String]?
        var selected: Bool?
    }
    
    var viewModel: Model? = .init() {
        didSet {
            titleLabel.viewModel = .init(text: viewModel?.title, textColor: .darkBlue)
            subTitleLabel.viewModel = .init(text: viewModel?.subTitle, textColor: .gray)
            
            selectedView.isHidden = !(viewModel?.selected ?? true)
            
            stackView.arrangedSubviews.forEach { subview in
                subview.removeFromSuperview()
            }
            for i in 0..<(viewModel?.image?.count ?? 0) {
                let image = UIImageView()
                image.image = UIImage(named: viewModel?.image?[i] ?? "")
                image.contentMode = .scaleAspectFit
                image.setContentHuggingPriority(.required, for: .horizontal)
                image.setContentCompressionResistancePriority(.required, for: .horizontal)
                stackView.addArrangedSubview(image)
            }
        }
    }
    
    enum Action {
        
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1)
        return view
    }()
    
    private lazy var circleView: CircleView = {
        let view = CircleView(heigth: 20, width: 20, color: UIColor(red: 0.969, green: 0.973, blue: 0.984, alpha: 1))
        view.borderWidth = 1
        view.borderColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var selectedView: CircleView = {
        let view = CircleView(heigth: 10, width: 10, color: UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private var titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor ~= 19
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private var subTitleLabel: Label = {
        let view = Label(size: 10, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor ~= 19
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 10
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(backgroundView)
        addSubview(circleView)
        addSubview(selectedView)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        addSubview(stackView)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        backgroundView.pinToSuperview(left: 33, top: 10, right: 33, bottom: 10)
        
        circleView.topAnchor ~= backgroundView.topAnchor + 31
        circleView.leftAnchor ~= backgroundView.leftAnchor + 21
        circleView.bottomAnchor ~= backgroundView.bottomAnchor - 30
        
        selectedView.centerXAnchor ~= circleView.centerXAnchor
        selectedView.centerYAnchor ~= circleView.centerYAnchor
        
        titleLabel.topAnchor ~= backgroundView.topAnchor + 18
        titleLabel.leftAnchor ~= circleView.rightAnchor + 18
        titleLabel.rightAnchor <= stackView.leftAnchor - 5
        
        subTitleLabel.bottomAnchor ~= backgroundView.bottomAnchor - 18
        subTitleLabel.leftAnchor ~= circleView.rightAnchor + 18
        subTitleLabel.rightAnchor <= stackView.leftAnchor - 5
        
        stackView.centerYAnchor ~= backgroundView.centerYAnchor
        stackView.rightAnchor ~= backgroundView.rightAnchor - 15
    }
}
