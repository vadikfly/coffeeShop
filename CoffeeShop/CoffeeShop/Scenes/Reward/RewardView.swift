//
//  RewardView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class RewardView: View {
    
    struct Model {
        var bonusPoints: String?
        var countText: String?
        var totalCount: Int = 0
        var currentCount: Int = 0
        var items: [RewardCell.Model]
    }
    var viewModel: Model = .init(items: []) {
        didSet {
            rewardTableView.items = viewModel.items
            bonusPointsView.bonusPointsCount = viewModel.bonusPoints
            loyaltyCardView.viewModel = .init(countText: viewModel.countText, totalCount: viewModel.totalCount, selectedCount: viewModel.currentCount)
        }
    }
    
    enum Action {
        case payByPoints
    }
    var actionHandler: (Action) -> Void = { _ in }


    
    private lazy var titleLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Вознаграждение", textColor: .black)
        return view
    }()
    
    private lazy var loyaltyCardView: LoyaltyCardView = {
        let view = LoyaltyCardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textTitle = "Карта лояльности"
        view.viewModel = .init(countText: "6 / 8" )
        return view
    }()
    
    private lazy var bonusPointsView: BonusPointsView = {
        let view = BonusPointsView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = {
            self.actionHandler(.payByPoints)
        }
        return view
    }()
    
    private lazy var subTitleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "История начисления баллов", textColor: .black)
        return view
    }()
    
    private lazy var rewardTableView: RewardTable = {
        let view = RewardTable()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(loyaltyCardView)
        addSubview(bonusPointsView)
        addSubview(rewardTableView)
        addSubview(subTitleLabel)
        backgroundColor = .white
    }
    
    override func setupLayout() {
        super.setupLayout()
        titleLabel.topAnchor ~= safeAreaLayoutGuide.topAnchor + 13
        titleLabel.leftAnchor >= leftAnchor + 10
        titleLabel.centerXAnchor ~= centerXAnchor
        titleLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        loyaltyCardView.topAnchor ~= titleLabel.bottomAnchor + 26
        loyaltyCardView.centerXAnchor ~= centerXAnchor
        loyaltyCardView.leftAnchor ~= leftAnchor + 25
        loyaltyCardView.rightAnchor ~= rightAnchor - 25
        
        bonusPointsView.topAnchor ~= loyaltyCardView.bottomAnchor + 16
        bonusPointsView.centerXAnchor ~= centerXAnchor
        bonusPointsView.leftAnchor ~= leftAnchor + 25
        bonusPointsView.rightAnchor ~= rightAnchor - 25
        
        subTitleLabel.topAnchor ~= bonusPointsView.bottomAnchor + 31
        subTitleLabel.leftAnchor ~= leftAnchor + 31
        subTitleLabel.heightAnchor.constraint(equalToConstant: 21).isActive = true
        
        rewardTableView.topAnchor ~= subTitleLabel.bottomAnchor + 8
        rewardTableView.leftAnchor ~= leftAnchor
        rewardTableView.rightAnchor ~= rightAnchor
        rewardTableView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        
        
    }
}
