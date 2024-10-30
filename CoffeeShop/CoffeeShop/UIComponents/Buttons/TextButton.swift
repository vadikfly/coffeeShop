//
//  TextButton.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//

import UIKit

class TextButton: UIView {
    
    var actionHandler: () -> Void = {} {
        didSet{
            textButton.addAction(
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
        var text: String?
        var textSize: Int = 14
    }

    var viewModel: Model = .init() {
        didSet {
            textButton.setTitle(viewModel.text, for: .normal)
            textButton.titleLabel?.font = UIFont(name: "Poppins-Medium", size: CGFloat(viewModel.textSize))

        }
    }
    
    private lazy var textButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1), for: .normal)
        view.titleLabel?.font = UIFont(name: "Poppins-Medium", size: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.titleLabel?.numberOfLines = 0
        view.titleLabel?.lineBreakMode = .byWordWrapping
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
        addSubview(textButton)
    }
    
    func setupLayout() {
       textButton.topAnchor.constraint(equalTo: topAnchor).isActive = true
       textButton.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
       textButton.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
       textButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
}

