//
//  IconButton.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//

import UIKit

class IconButton: UIView {
    
    var actionHandler: () -> Void = {} {
        didSet{
            iconButton.addAction(
                UIAction(
                    handler: { _ in
                        self.actionHandler()
                    }
                ),
                for: .touchUpInside
            )
        }
    }
    
    struct Model {
        var systemName: String = "arrow.left"
        var pointSize: CGFloat = 22
        var sizeButton: CGFloat = 64
        var colorButton: UIColor?
        var colorIcon: UIColor? 
    }

    var viewModel: Model = .init() {
        didSet {
            iconButton.setImage(
                UIImage(
                    systemName: viewModel.systemName,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.pointSize,
                        weight: UIImage.SymbolWeight.regular
                    )
                ),
                for: .normal
            )
            iconButton.setImage(
                UIImage(
                    systemName: viewModel.systemName,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.pointSize - 4,
                        weight: UIImage.SymbolWeight.regular
                    )
                ),
                for: .highlighted
            )
            iconButton.tintColor = viewModel.colorIcon
            iconButton.backgroundColor = viewModel.colorButton
            iconButton.layer.cornerRadius = viewModel.sizeButton / 2
            iconButton.widthAnchor.constraint(equalTo: iconButton.heightAnchor).isActive = true
            
            heightConstraint = iconButton.heightAnchor.constraint(equalToConstant: viewModel.sizeButton)
            heightConstraint?.isActive = true

        }
    }
    
    var isEnabled: Bool = false {
        didSet {
            iconButton.isEnabled = isEnabled
        }
    }

    private var heightConstraint: NSLayoutConstraint? {
        didSet {
            // выключить старое значение констрейнта высоты
            oldValue?.isActive = false
        }
    }
    
    private lazy var iconButton: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        addSubview(iconButton)
    }
    
    func setupLayout() {
        iconButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
        iconButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        iconButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        iconButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

