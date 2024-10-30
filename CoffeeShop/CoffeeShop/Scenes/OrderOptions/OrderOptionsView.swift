//
//  OrderOptionsView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 14.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderOptionsView: View {
    
    var initialViewModel: OrderOptions.InitialConfigViewModel = .init(
        coffeeName: "",
        coffeeImage: "",
        cookMinuteInterval: 10
    ) {
        didSet {
            countView.coffeeName = initialViewModel.coffeeName
            coffeImageView.coffeeImage = initialViewModel.coffeeImage
            cookTime.minuteInterval = initialViewModel.cookMinuteInterval
        }
    }
    
    var currentViewModel: OrderOptions.CurrentValuesViewModel = .init(
        countText: "",
        doubleRistretto: false,
        takeAway: true,
        volumeSelectedIndex: 1,
        cookTimeEnabled: false,
        cookTime: nil,
        price: ""
    ) {
        didSet {
            countView.coffeeCount = currentViewModel.countText
            ristrettoView.isSelected = currentViewModel.doubleRistretto
            placeView.viewModel.selectedIndex = currentViewModel.takeAway ? 1 : 0
            volumeView.viewModel.selectedIndex = currentViewModel.volumeSelectedIndex
            cookTime.cookSwitch = currentViewModel.cookTimeEnabled
            cookTime.cookTime = currentViewModel.cookTime
            footerView.price = currentViewModel.price
        }
    }
    
    enum Action {
        case close
        case cart
        case plusCount
        case minusCount
        case oneRistretto
        case twoRistretto
        case place(Int)
        case volume(Int)
        case cookSwitch(Bool)
        case cookTime(Date)
        case constructor
        case next
    }
    
    var actionHandler: (Action) -> Void = { _ in }
    
    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Заказ")
        view.actionHandler = { action in
            switch action {
            case .back:
                self.actionHandler(.close)
                print("close")
            case .buy:
                self.actionHandler(.cart)
                print("cart")
            }
        }
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(
            arrangedSubviews: [
                coffeImageView,
                countView,
                ristrettoView,
                placeView,
                volumeView,
                cookTime,
                constructorButton
            ]
        )
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private var coffeImageView: ConstructorImageView = {
        let view = ConstructorImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var countView: ConstructorCountView = {
        let view = ConstructorCountView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .minus:
                self.actionHandler(.minusCount)
            case .plus:
                self.actionHandler(.plusCount)
            }
        }
        return view
    }()
    
    private lazy var ristrettoView: ConstructorRistrettoView = {
        let view = ConstructorRistrettoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .oneRistretto:
                self.actionHandler(.oneRistretto)
                print("oneRistretto")
            case .twoRistretto:
                self.actionHandler(.twoRistretto)
                print("twoRistretto")
            }
        }
        return view
    }()
    
    private lazy var placeView: SegmentedControlView = {
        let view = SegmentedControlView(top: 1, bottom: 17, left: 10, right: 25, separatorLeft: 7, separatorRight: 7)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            actions: [
                UIImage(named: "Cup")!,
                UIImage(named: "Glass")!
            ],
            selectedIndex: 1,
            title: "На месте / на вынос"
        )
        view.spacing = 31
        view.actionHandler = { index in
            self.actionHandler(.place(index))
            print(index)
        }
        return view
    }()
    
    private lazy var volumeView: SegmentedControlView = {
        let view = SegmentedControlView(top: 2, bottom: 17, left: 10, right: 20, separatorLeft: 7, separatorRight: 7)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            actions: [
                UIImage(named: "250ml")!,
                UIImage(named: "350ml")!,
                UIImage(named: "450ml")!
            ],
            selectedIndex: 1,
            title: "Объем, мл"
        )
        view.spacing = 26
        view.actionHandler = { index in
            self.actionHandler(.volume(index))
            print(index)
        }
        view.alignmentElements = .bottom
        return view
    }()
    
    private lazy var cookTime: CookTimeView = {
        let view = CookTimeView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .cookSwitch(let cookSwitch):
                self.actionHandler(.cookSwitch(cookSwitch))
            case .cookTime(let cookTime):
                self.actionHandler(.cookTime(cookTime))
            }
        }
        return view
    }()
    
    private lazy var constructorButton: ConstructorButton = {
        let view = ConstructorButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.constructor)
                    print("И на текст теперь нажимается")
                }
            ),
            for: .touchUpInside
        )
        return view
    }()
    
    private lazy var footerView: ConstructorFooterView = {
        let view = ConstructorFooterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .next:
                self.actionHandler(.next)
            }
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(footerView)
        addSubview(headerView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
    }

    override func setupLayout() {
        super.setupLayout()
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= leftAnchor
        headerView.rightAnchor ~= rightAnchor
        
        scrollView.topAnchor ~= headerView.bottomAnchor + 19
        scrollView.bottomAnchor ~= footerView.topAnchor - 5
        scrollView.leftAnchor ~= leftAnchor
        scrollView.rightAnchor ~= rightAnchor
        
        stackView.widthAnchor ~= scrollView.frameLayoutGuide.widthAnchor - 50
        stackView.topAnchor ~= scrollView.topAnchor
        stackView.bottomAnchor ~= scrollView.bottomAnchor
        stackView.leftAnchor ~= scrollView.leftAnchor + 25
        stackView.rightAnchor ~= scrollView.rightAnchor - 25

        footerView.leftAnchor ~= leftAnchor + 30
        footerView.rightAnchor ~= rightAnchor - 30
        footerView.bottomAnchor <= bottomAnchor - 10
        let bottom = footerView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
