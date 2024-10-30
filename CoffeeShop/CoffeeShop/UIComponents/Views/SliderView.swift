//
//  SliderView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 15.09.2021.
//
import UIKit

class SliderView: View {
    
    var value: Float? {
        didSet {
            slider.value = value ?? 0.5
        }
    }
    
    enum Action {
        case sliderValue(Float)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private var titleLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Вид кофе", textColor: .darkBlue)
        return view
    }()
    
    private lazy var slider: UISlider = {
        let view = UISlider()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.value = 0.5
        view.minimumValue = 0.0
        view.maximumValue = 1.0
        view.isContinuous = true
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.sliderValue(view.value))
                    print(view.value)
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    private var subTitleLabel: Label = {
        let view = Label(size: 12, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Арабика", textColor: .lightGray)
        return view
    }()
    
    private var subTitleLabel2: Label = {
        let view = Label(size: 12, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Робуста", textColor: .lightGray)
        return view
    }()
    
    private let separator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .systemGray6
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(slider)
        addSubview(subTitleLabel)
        addSubview(subTitleLabel2)
        addSubview(separator)
    }
    
    override func setupLayout() {
        super.setupLayout()
        titleLabel.topAnchor ~= topAnchor + 23
        titleLabel.leftAnchor ~= leftAnchor
        
        slider.centerYAnchor ~= titleLabel.centerYAnchor
        slider.leftAnchor ~= titleLabel.rightAnchor + 11
        slider.widthAnchor ~= 228
        
        subTitleLabel.topAnchor ~= slider.bottomAnchor + 4
        subTitleLabel.leftAnchor ~= slider.leftAnchor
        
        subTitleLabel2.topAnchor ~= slider.bottomAnchor + 4
        subTitleLabel2.rightAnchor ~= slider.rightAnchor
        
        separator.topAnchor ~= slider.bottomAnchor + 30
        separator.leftAnchor ~= titleLabel.leftAnchor
        separator.rightAnchor ~= rightAnchor
        separator.bottomAnchor ~= bottomAnchor
        
        
    }
}

