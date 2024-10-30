//
//  ConstructorRistrettoView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.10.2021.
//

import UIKit

class ConstructorRistrettoView: View {
    
    struct Model {
        var oneRistretto: Bool
        var twoRistretto: Bool
    }
    
    var isSelected: Bool = false {
        didSet {
            if isSelected {
                oneButton.isSelected = false
                twoButton.isSelected = true
            }
            else {
                oneButton.isSelected = true
                twoButton.isSelected = false
            }
        }
    }
    
    enum Action {
        case oneRistretto
        case twoRistretto
    }
    var actionHandler: (Action) -> Void = { _ in }

    private lazy var titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Ристретто", textAlignment: .left, textColor: .black)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private lazy var oneButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Один", textSize: 12, textColor: UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1), cornerRadius: 15, colorButton: .white, highlightedColor: UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 0.4), textWeight: "Poppins-Medium")
        view.borderWidth = 1
        view.borderColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 0.4)
        view.actionHandler = {
            self.actionHandler(.oneRistretto)
        }
        view.setContentCompressionResistancePriority(.required, for: .horizontal)
        view.setContentHuggingPriority(.required, for: .horizontal)
        return view
    }()
    
    private lazy var twoButton: Button = {
        let view = Button()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Два", textSize: 12, textColor: UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1), cornerRadius: 15, colorButton: .white, highlightedColor: UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 0.4), textWeight: "Poppins-Medium")
        view.borderWidth = 1
        view.borderColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 0.4)
        view.actionHandler = {
            self.actionHandler(.twoRistretto)
        }
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
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(oneButton)
        addSubview(twoButton)
        addSubview(separator)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        titleLabel.leftAnchor ~= leftAnchor + 10
        titleLabel.centerYAnchor ~= oneButton.centerYAnchor
        
        oneButton.heightAnchor ~= 29
        oneButton.widthAnchor ~= 73
        oneButton.leftAnchor ~= titleLabel.rightAnchor
        oneButton.rightAnchor ~= twoButton.leftAnchor - 8
        oneButton.centerYAnchor ~= twoButton.centerYAnchor
        
        
        twoButton.heightAnchor ~= 29
        twoButton.widthAnchor ~= 73
        twoButton.topAnchor ~= topAnchor + 7
        twoButton.rightAnchor ~= rightAnchor - 23
        twoButton.bottomAnchor ~= separator.topAnchor - 16
        
        separator.leftAnchor ~= leftAnchor + 7
        separator.rightAnchor ~= rightAnchor - 7
        separator.bottomAnchor ~= bottomAnchor
    }
}
