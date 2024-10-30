//
//  BaristaCellView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 21.10.2021.
//

import UIKit

class BaristaCellView: View, SimpleContentCell {
    
    struct Model {
        var baristaPhoto: String?
        var baristaName: String?
        var baristaSkill: String?
        var status: Bool?
    }
    
    var viewModel: Model? {
        didSet {
            baristaPhoto.image = UIImage(named: viewModel?.baristaPhoto ?? "baristaPhoto")
            subTitleLabel.viewModel = .init(text: viewModel?.baristaSkill, textColor: .lightGray)

            if viewModel?.status == true {
                titleLabel.viewModel = .init(text: viewModel?.baristaName, textColor: .darkBlue)
                status.color = UIColor(red: 0.199, green: 0.9, blue: 0.269, alpha: 1)
            }
            else {
                titleLabel.viewModel = .init(text: viewModel?.baristaName, textColor: .lightGray)
                status.color = UIColor(red: 1, green: 0.188, blue: 0.188, alpha: 1)
            }
        }
    }
    
    enum Action {
        case tap
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 22
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor(red: 0.353, green: 0.424, blue: 0.918, alpha: 0.07).cgColor
        view.layer.shadowRadius = 6
        view.layer.shadowOffset = CGSize(width: 12, height: 8)
        return view
    }()
    
    private var baristaPhoto: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var titleLabel: Label = {
        let view = Label(size: 15, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var subTitleLabel: Label = {
        let view = Label(size: 14, weight: .regular)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var status: CircleView = {
        let view = CircleView(heigth: 15, width: 15, color: UIColor(red: 0.199, green: 0.9, blue: 0.269, alpha: 1))
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        addSubview(backgroundView)
        backgroundView.addSubview(baristaPhoto)
        addSubview(titleLabel)
        addSubview(subTitleLabel)
        backgroundView.addSubview(status)
    }
    
    override func setupLayout() {
        super.setupLayout()
        backgroundView.pinToSuperview(left: 20, top: 9, right: 20, bottom: 10)
        baristaPhoto.pinToSuperview(left: 8, top: 8, right: 265, bottom: 10)
        
        titleLabel.leftAnchor ~= baristaPhoto.rightAnchor + 18
        titleLabel.topAnchor ~= backgroundView.topAnchor + 18
        
        subTitleLabel.leftAnchor ~= baristaPhoto.rightAnchor + 18
        subTitleLabel.topAnchor ~= titleLabel.bottomAnchor + 8
        
        status.pinToSuperview(left: 286, top: 33, right: 34, bottom: 33)

    }
}

