//
//  OrderHeaderButton.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 12.09.2021.
//

import UIKit

class OrderHeaderButton: UIView {
    
    var actionHandler: () -> Void = {}
    
    struct Model {
        var text: String?
        var textSize: Int = 14
        var textColor: UIColor?
    }

    var viewModel: Model = .init() {
        didSet {
            button.setTitle(viewModel.text, for: .normal)
            button.titleLabel?.font = UIFont(name: "Poppins-Medium", size: CGFloat(viewModel.textSize))
            button.setTitleColor(viewModel.textColor, for: .normal)
        }
    }
    
    var textColor: UIColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1) {
        didSet {
            button.setTitleColor(textColor, for: .normal)
        }
    }
    
    var separatorHide: Bool = false {
        didSet {
            separator.isHidden = separatorHide
        }
    }
    
    private lazy var button: UIButton = {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler()
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    private var separator: SeparatorView = {
        let view = SeparatorView(heigth: 2)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
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
        addSubview(separator)
    }
    
    func setupLayout() {
        
        button.topAnchor ~= topAnchor
        button.centerXAnchor ~= centerXAnchor
        button.leftAnchor <= leftAnchor
        button.bottomAnchor ~= separator.topAnchor - 11
        
        separator.bottomAnchor ~= bottomAnchor
        separator.leftAnchor ~= button.leftAnchor
        separator.rightAnchor ~= button.rightAnchor
        

    }
}

