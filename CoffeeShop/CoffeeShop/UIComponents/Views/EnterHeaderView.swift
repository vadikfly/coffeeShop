//
//  HeaderViewForEnter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 10.09.2021.
//

final class EnterHeaderView: View {
    
    enum Action {
        case back
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    struct Model {
        var textTitle: String?
        var textSubTitle: String?
    }
    
    var viewModel: Model = .init() {
        didSet {
            titleLabel.viewModel.text = viewModel.textTitle
            subtitleLabel.viewModel.text = viewModel.textSubTitle
        }
    }
    
    
    private lazy var backButton: IconButton = {
        let view = IconButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        var config = view.viewModel
        config.systemName = "arrow.left"
        config.pointSize = 17
        config.sizeButton = 17
        config.colorIcon = .black
        view.viewModel = config
        view.actionHandler = {
            self.actionHandler(.back)
        }
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 22, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel.text = "Войти"
        view.viewModel.textColor = .darkBlue
        return view
    }()
    
    private var subtitleLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel.text = "Добро пожаловать"
        view.viewModel.textColor = .gray
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(backButton)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        backButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 18).isActive = true
        backButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 29.5).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: backButton.topAnchor, constant: 66).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 41).isActive = true
        
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 50).isActive = true
        subtitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subtitleLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        
    }
}
