//
//  LongButtonView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 16.09.2021.
//

import UIKit

class LongButtonView: UIControl {
    
    struct Model {
        var iconName: String?
        var iconColor: UIColor?
        var iconSize: CGFloat = 12
        var iconWeight: UIImage.SymbolWeight = .regular
        var text: String?
        var textSize: CGFloat = 14
        var textWeight: Label.weightFont = .medium
        var textColor: Label.Color = .darkBlue
    }
    
    var viewModel: Model = .init() {
        didSet {
            titleLabel.viewModel = .init(text: viewModel.text, textColor: viewModel.textColor)

            iconImage.tintColor = viewModel.iconColor
            if let name = viewModel.iconName {
                iconImage.image = UIImage(
                    systemName: name,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.iconSize,
                        weight: viewModel.iconWeight
                    )
                )
            }
            else {
                iconImage.image = nil
            }
        }
    }
    
    var hiddenRightLabel: Bool = true {
        didSet {
            rightLabel.isHidden = hiddenRightLabel
            if hiddenRightLabel == false {
                iconImage.isHidden = true
            }
        }
    }
    
    var rightLabelText: String? {
        didSet {
            rightLabel.viewModel.text = rightLabelText
        }
    }

    var textSize: CGFloat? {
        didSet {
            titleLabel.textSize = textSize ?? 14
        }
    }
    
    enum Action {
        case click
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private var titleLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Выбери бариста", textColor: .darkBlue)
        return view
    }()
    
    private var rightLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Выбрать", textColor: .darkBlue)
        view.isHidden = true
        return view
    }()
    
    private let iconImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.tintColor = .red
        view.image = UIImage(
            systemName: "chevron.right",
            withConfiguration: UIImage.SymbolConfiguration(
                pointSize: 23,
                weight: UIImage.SymbolWeight.regular
            )
        )
        return view
    }()
    
    private let shortSeparator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    init(constantTop: CGFloat, constantSeparator: CGFloat, separatorColor: UIColor, constantIconRight: CGFloat) {
        super.init(frame: .zero)
        // setup
        setupView(separatorColor: separatorColor)
        setupContent()
        setupLayout(constantTop: constantTop, constSeparator: constantSeparator, constantIconRight: constantIconRight)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(separatorColor: UIColor) {
        shortSeparator.color = separatorColor
        addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.click)
                    print("нажал выбор контрола")
                }
            ),
            for: .touchUpInside
        )
    }
    
    func setupContent() {
        addSubview(titleLabel)
        addSubview(rightLabel)
        addSubview(iconImage)
        addSubview(shortSeparator)
        
    }
    
    func setupLayout(constantTop: CGFloat, constSeparator: CGFloat, constantIconRight: CGFloat) {
        
        
        titleLabel.topAnchor ~= topAnchor + constantTop
        titleLabel.leftAnchor ~= leftAnchor
        titleLabel.rightAnchor <= rightAnchor - 20
        
        rightLabel.centerYAnchor ~= titleLabel.centerYAnchor
        rightLabel.rightAnchor ~= rightAnchor - 19
        
        iconImage.rightAnchor ~= rightAnchor - constantIconRight
        iconImage.centerYAnchor ~= titleLabel.centerYAnchor
        
        shortSeparator.topAnchor ~= titleLabel.bottomAnchor + constSeparator
        shortSeparator.leftAnchor ~= titleLabel.leftAnchor
        shortSeparator.rightAnchor ~= rightAnchor
        shortSeparator.bottomAnchor ~= bottomAnchor
    }
}
