//
//  HeaderOrderView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 15.09.2021.
//

import UIKit

class OrderHeaderView: UIView {
    
    var arrayButton: [OrderHeaderButton] = []
    
    struct Model {
        var actions: [String]
        var selectedIndex: Int
    }
    
    var viewModel: Model = .init(actions: [], selectedIndex: 0) {
        didSet {
            stackView.arrangedSubviews.forEach { subview in
                subview.removeFromSuperview()
            }
            for (index, title) in viewModel.actions.enumerated() {
                let button = createTabAction(
                    title: title,
                    selected: index == viewModel.selectedIndex,
                    index: index
                )
                arrayButton.append(button)
                stackView.addArrangedSubview(arrayButton[index])
                
            }
        }
    }
    
    var actionHandler: (Int) -> Void = { _ in }
    
    private let titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.viewModel = .init(text: "Мой заказ", textAlignment: .center, textColor: .black)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.spacing = 78
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = .init(top: 0, left: 56, bottom: 0, right: 56)
        return view
    }()
    
    private let separator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = UIColor(red: 0.957, green: 0.961, blue: 0.969, alpha: 1)
        return view
    }()
    
    init() {
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

    }
   
    func setupContent() {
        // add subviews
        addSubview(titleLabel)
        addSubview(stackView)
        addSubview(separator)
    }
    
    func setupLayout() {
        titleLabel.topAnchor ~= safeAreaLayoutGuide.topAnchor + 13
        titleLabel.centerXAnchor ~= centerXAnchor
        titleLabel.leftAnchor ~= leftAnchor + 10
        
        stackView.topAnchor ~= titleLabel.bottomAnchor + 20
        stackView.leftAnchor ~= leftAnchor
        stackView.rightAnchor ~= rightAnchor
        stackView.bottomAnchor ~= separator.topAnchor
        
        separator.leftAnchor ~= leftAnchor
        separator.rightAnchor ~= rightAnchor
        separator.bottomAnchor ~= bottomAnchor
    }

    private func createTabAction(title: String, selected: Bool, index: Int) -> OrderHeaderButton {
        let view = OrderHeaderButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        if selected {
            view.viewModel = .init(text: title, textSize: 14, textColor: .black)
            view.separatorHide = false
        }
        else {
            view.viewModel = .init(text: title, textSize: 14, textColor: .gray)
            view.separatorHide = true
        }
        view.actionHandler = {
            for i in 0..<self.arrayButton.count {
                self.arrayButton[i].textColor = .gray
                self.arrayButton[i].separatorHide = true
            }
            view.textColor = .black
            view.separatorHide = false
            
            self.actionHandler(index)
        }
        return view
    }
}



