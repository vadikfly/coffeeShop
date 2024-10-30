//
//  SegmentedControlView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 10.09.2021.
//

import UIKit

class SegmentedControlView: UIView {
    struct Model {
        var actions: [UIImage]
        var selectedIndex: Int
        var title: String
    }
    var viewModel: Model = .init(actions: [], selectedIndex: 0, title: "") {
        didSet {
            stackView.arrangedSubviews.forEach { subview in
                subview.removeFromSuperview()
            }
            for (index, image) in viewModel.actions.enumerated() {
                let button = createTabAction(
                    image: image,
                    selected: index == viewModel.selectedIndex,
                    index: index
                )
                stackView.addArrangedSubview(button)
            }
            titleLabel.viewModel = .init(text: viewModel.title, textAlignment: .left, textColor: .black)
        }
    }
    
    var alignmentElements: UIStackView.Alignment? {
        didSet {
            stackView.alignment = alignmentElements ?? .center
        }
    }
    
    var spacing: CGFloat? {
        didSet {
            stackView.spacing = spacing ?? 0
        }
    }
    
    var separatorHide: Bool? {
        didSet {
            separator.isHidden = separatorHide ?? false
        }
    }
    
    var actionHandler: (Int) -> Void = { _ in }
    
    private let titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()

    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .horizontal
        view.spacing = 20
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()
    
    private let separator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = UIColor(red: 0.957, green: 0.961, blue: 0.969, alpha: 1)
        return view
    }()
    
    init(top: CGFloat, bottom: CGFloat, left: CGFloat, right: CGFloat, separatorLeft: CGFloat, separatorRight: CGFloat) {
        super.init(frame: .zero)
        // setup
        setupView()
        setupContent()
        setupLayout(top, bottom, left, right, separatorLeft, separatorRight)
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
    
    func setupLayout(_ top: CGFloat, _ bottom: CGFloat, _ left: CGFloat, _ right: CGFloat, _ separatorLeft: CGFloat, _ separatorRight: CGFloat) {
        titleLabel.leftAnchor ~= leftAnchor + left
        titleLabel.rightAnchor ~= stackView.leftAnchor
        titleLabel.centerYAnchor ~= stackView.centerYAnchor

        stackView.topAnchor ~= topAnchor + top
        stackView.rightAnchor ~= rightAnchor - right
        stackView.bottomAnchor ~= separator.topAnchor - bottom
        
        separator.leftAnchor ~= leftAnchor + separatorLeft
        separator.rightAnchor ~= rightAnchor - separatorRight
        separator.bottomAnchor ~= bottomAnchor
    }

    private func createTabAction(image: UIImage, selected: Bool, index: Int) -> UIButton {
        let view = UIButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.setImage(image, for: .normal)
        if selected {
            view.tintColor = .black
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
                    view.tintColor = .black
                    self.actionHandler(index)
                }
            ),
            for: .touchUpInside
        )
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }
}
