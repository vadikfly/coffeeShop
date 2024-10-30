//
//  TabBar.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//


import UIKit

class TabBarView: UIView {
    struct Model {
        var actions: [UIImage]
        var selectedIndex: Int
    }
    var viewModel: Model = .init(actions: [], selectedIndex: 0) {
        didSet {
            stackView.arrangedSubviews.forEach { subview in
                subview.removeFromSuperview()
            }
            for (index, image) in viewModel.actions.enumerated() {
                let button = createTabAction(
                    with: image,
                    selected: index == viewModel.selectedIndex,
                    index: index
                )
                stackView.addArrangedSubview(button)
            }
        }
    }
    
    var actionHandler: (Int) -> Void = { _ in }

    private let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 0.12).cgColor
        view.layer.shadowRadius = 20
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.distribution = .fillEqually
        view.axis = .horizontal
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = .init(top: 16, left: 0, bottom: 16, right: 0)
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
        addSubview(backgroundView)
        backgroundView.addSubview(stackView)
    }
    
    func setupLayout() {
        backgroundView.pinToSuperview()
        stackView.pinToSuperview()
    }

    private func createTabAction(with image: UIImage, selected: Bool, index: Int) -> UIButton {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(image, for: .normal)
        if selected {
            view.tintColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
        }
        else {
            view.tintColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
        }

        view.addAction(
            UIAction(
                handler: { _ in
                    for subview in self.stackView.arrangedSubviews {
                        subview.tintColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
                    }
                    view.tintColor = UIColor(red: 0.196, green: 0.29, blue: 0.349, alpha: 1)
                    self.actionHandler(index)
                }
            ),
            for: .touchUpInside
        )

        return view
    }
}


