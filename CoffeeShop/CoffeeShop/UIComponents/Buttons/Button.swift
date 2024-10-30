//
//  Button.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 12.09.2021.
//

import UIKit

class Button: UIView {
    
    var actionHandler: () -> Void = {} {
        didSet{
            button.addAction(
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
        var text: String = ""
        var textSize: Int = 10
        var textColor: UIColor?
        var cornerRadius: CGFloat = 20
        var image: String = ""
        var pointSize: CGFloat = 22
        var colorButton: UIColor?
        var highlightedColor: UIColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1) // цвет нажатой кнопки
        var colorIcon: UIColor? 
        var textWeight: String = "Poppins-Medium"
    }
    
    var viewModel: Model = .init() {
        didSet {
            
            button.setImage(
                UIImage(
                    systemName: viewModel.image,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.pointSize,
                        weight: UIImage.SymbolWeight.regular
                    )
                ),
                for: .normal
            )
            button.setImage(
                UIImage(
                    systemName: viewModel.image,
                    withConfiguration: UIImage.SymbolConfiguration(
                        pointSize: viewModel.pointSize - 4,
                        weight: UIImage.SymbolWeight.regular
                    )
                ),
                for: .highlighted
            )
            button.setTitle(viewModel.text, for: .normal)
            button.setTitleColor(viewModel.textColor, for: .normal)
            button.titleLabel?.font = UIFont(name: viewModel.textWeight, size: CGFloat(viewModel.textSize))
            button.layer.cornerRadius = viewModel.cornerRadius
            button.tintColor = viewModel.colorIcon
            button.backgroundColor = viewModel.colorButton
            button.addAction(.init(handler: { _ in
                self.button.backgroundColor = self.viewModel.highlightedColor
            }), for: .touchDown)
            button.addAction(.init(handler: { _ in
                self.button.backgroundColor = self.viewModel.colorButton
            }), for: .touchUpInside)
            button.addAction(.init(handler: { _ in
                self.button.backgroundColor = self.viewModel.colorButton
            }), for: .touchUpOutside)
            
        }
    }
    
    var borderWidth: CGFloat? {
        didSet {
            button.layer.borderWidth = borderWidth ?? 0
        }
    }
    
    var borderColor: UIColor? {
        didSet {
            button.layer.borderColor = borderColor?.cgColor
        }
    }
    
    var isSelected: Bool = false {
        didSet {
            button.isSelected = isSelected
            if isSelected {
                button.backgroundColor = viewModel.highlightedColor
            }
            else{
                button.backgroundColor = viewModel.colorButton
            }
        }
    }

    private lazy var button: UIButton = {
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
        addSubview(button)
    }
    
    func setupLayout() {
        button.topAnchor.constraint(equalTo: topAnchor).isActive = true
        button.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

