//
//  Label.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//

import UIKit

class Label: UIView {
    
    var namedFont: String = "Poppins-Regular"
    
    struct Model {
        var text: String?
        var textAlignment: NSTextAlignment = .left
        var textColor: Color?
    }
    
    var viewModel: Model = .init() {
        didSet {
            label.text = viewModel.text
            label.textAlignment = viewModel.textAlignment
            
            switch viewModel.textColor {
            case .black:
                label.textColor = UIColor(red: 0.094, green: 0.114, blue: 0.176, alpha: 1)
            case .gray:
                label.textColor = UIColor(red: 0.667, green: 0.667, blue: 0.667, alpha: 1)
            case .lightGray:
                label.textColor = UIColor(red: 0.847, green: 0.847, blue: 0.847, alpha: 1)
            case .white:
                label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            case .blue:
                label.textColor = UIColor(red: 0, green: 0.478, blue: 1, alpha: 1)
            case .darkBlue:
                label.textColor = UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1)
            case .none:
                label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            }
        }
    }

    var textSize: CGFloat? {
        didSet {
            label.font = UIFont(name: "Poppins-Regular", size: textSize ?? 17)
        }
    }
    
    enum weightFont {
        case light
        case regular
        case medium
        case bold
        case semibold
    }
    
    enum Color {
        case black
        case gray
        case lightGray
        case white
        case blue
        case darkBlue
    }
    
    private var labelFont: UIFont? {
        didSet {
            label.font = labelFont
        }
    }
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        return view
    }()
    
    init(size: CGFloat, weight: weightFont) {
        switch weight {
        case .regular:
            namedFont = "Poppins-Regular"
        case .light:
            namedFont = "Poppins-Light"
        case .medium:
            namedFont = "Poppins-Medium"
        case .bold:
            namedFont = "Poppins-Bold"
        case .semibold:
            namedFont = "Poppins-Semibold"
        }
        super.init(frame: .zero)
        
        label.font = UIFont(name: namedFont, size: size)
        
        setupView()
        setupContent()
        setupLayout()
        
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        isUserInteractionEnabled = false
    }
    
    func setupContent() {
        // add subviews
        addSubview(label)
    }
    
    func setupLayout() {
        
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        label.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
    }
    
    override func setContentHuggingPriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        label.setContentHuggingPriority(priority, for: axis)
    }
    
    override func setContentCompressionResistancePriority(_ priority: UILayoutPriority, for axis: NSLayoutConstraint.Axis) {
        label.setContentCompressionResistancePriority(priority, for: axis)
    }
}


