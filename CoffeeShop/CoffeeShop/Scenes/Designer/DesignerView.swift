//
//  DesignerView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class DesignerView: View {

    var viewModel: Designer.RootViewModel = .init(price: "") {
        didSet {
            print("currentview")
            footerView.price = viewModel.price
            coffeeTypeView.value = viewModel.coffeeTypeValue
            roasting.viewModel.selectedIndex = viewModel.roastingIndex ?? 0
            grinding.viewModel.selectedIndex = viewModel.grindingIndex ?? 0
            ice.viewModel = .init(actions: [
                UIImage(named: "ice1")!,
                UIImage(named: "ice2")!,
                UIImage(named: "ice3")!,
            ], selectedIndex: viewModel.iceIndex ?? 4, title: "Лёд")
            chooseMilk.rightLabelText = viewModel.chooseMilkText
            chooseSyrup.rightLabelText = viewModel.chooseSyrupText
            chooseBarista.viewModel = .init(
                iconName: "chevron.right",
                iconColor: .black,
                iconSize: 13,
                iconWeight: .light,
                text: viewModel.baristaName ?? "Выбери бариста",
                textSize: 14,
                textWeight: .semibold
            )
            coffeeVariety.viewModel = .init(
                iconName: "chevron.right",
                iconColor: .black,
                iconSize: 13,
                iconWeight: .light,
                text: viewModel.countryName ?? "Сорт кофе",
                textSize: 14,
                textWeight: .semibold
            )
            additives.viewModel = .init(
                iconName: "chevron.right",
                iconColor: .black,
                iconSize: 13,
                iconWeight: .light,
                text: viewModel.additives ?? "Добавки",
                textSize: 14,
                textWeight: .semibold
            )
        }
    }

    enum Action {
        case close
        case buy
        case chooseBarista
        case coffeTypeValue(Float) //слайдер
        case coffeeVariety //сорт
        case roasting(Int) //обжарка
        case grinding(Int) //помол
        case chooseMilk
        case chooseSyrup
        case additives
        case ice(Int)
        case next
        
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    private lazy var headerView: ConstructorHeaderView = {
        let view = ConstructorHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(textTitle: "Конструктор кофемана")
        view.actionHandler = { action in
            switch action {
            case .back:
                self.actionHandler(.close)
            case .buy:
                self.actionHandler(.buy)
            }
        }
        return view
    }()
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceVertical = true
        view.showsVerticalScrollIndicator = false
        view.showsHorizontalScrollIndicator = false
        view.delaysContentTouches = true
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [chooseBarista,coffeeTypeView , coffeeVariety, roasting, grinding, chooseMilk, chooseSyrup, additives, ice])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        return view
    }()

    private lazy var chooseBarista: LongButtonView = {
        let view = LongButtonView(constantTop: 12, constantSeparator: 18, separatorColor: .systemGray6, constantIconRight: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconName: "chevron.right", iconColor: .black, iconSize: 13, iconWeight: .light, text: "Выбери бариста", textSize: 14, textWeight: .semibold)
        view.actionHandler = { action in
            switch action{
            case .click:
                print("нажатие на выбор баристы")
                self.actionHandler(.chooseBarista)
            }
        }
        return view
    }()
    
    private lazy var coffeeTypeView: SliderView = {
        let view = SliderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .sliderValue(let value):
                self.actionHandler(.coffeTypeValue(value))
            }
        }
        return view
    }()
    
    private lazy var coffeeVariety: LongButtonView = {
        let view = LongButtonView(constantTop: 14, constantSeparator: 10, separatorColor: .systemGray6, constantIconRight: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconName: "chevron.right", iconColor: .black, iconSize: 13, iconWeight: .light, text: "Сорт кофе", textSize: 14, textWeight: .semibold)
        view.actionHandler = { action in
            switch action{
            case .click:
                self.actionHandler(.coffeeVariety)
                print("нажатие на выбор сорта")
            }
        }
        return view
    }()
    
    private lazy var roasting: SegmentedControlView = {
        let view = SegmentedControlView(top:8, bottom: 7, left: 0, right: 0, separatorLeft: 0, separatorRight: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(actions: [
            UIImage(named: "roasting1")!,
            UIImage(named: "roasting2")!,
            UIImage(named: "roasting3")!
        ], selectedIndex: 0, title: "Обжарка")
        view.actionHandler = { index in //
            self.actionHandler(.roasting(index))
            print(index)
        }
        view.alignmentElements = .bottom
        view.spacing = 25
        return view
    }()
    
    private lazy var grinding: SegmentedControlView = {
        let view = SegmentedControlView(top:8, bottom: 12, left: 0, right: 16, separatorLeft: 0, separatorRight: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(actions: [
            UIImage(named: "grinding1")!,
            UIImage(named: "grinding2")!,
        ], selectedIndex: 0, title: "Помол")
        view.actionHandler = { index in // 
            self.actionHandler(.grinding(index))
            print(index)
        }
        view.alignmentElements = .bottom
        view.spacing = 48
        return view
    }()
    
    private lazy var chooseMilk: LongButtonView = {
        let view = LongButtonView(constantTop: 22, constantSeparator: 14, separatorColor: .systemGray6, constantIconRight: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Молоко", textSize: 14, textWeight: .semibold)
        view.hiddenRightLabel = false
        view.actionHandler = { action in
            switch action{
            case .click:
                self.actionHandler(.chooseMilk)
            }
        }
        return view
    }()
    
    private lazy var chooseSyrup: LongButtonView = {
        let view = LongButtonView(constantTop: 16, constantSeparator: 14, separatorColor: .systemGray6, constantIconRight: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Сироп", textSize: 14, textWeight: .semibold)
        view.hiddenRightLabel = false
        view.actionHandler = { action in
            switch action{
            case .click:
                self.actionHandler(.chooseSyrup)
            }
        }
        return view
    }()
    
    private lazy var additives: LongButtonView = { 
        let view = LongButtonView(constantTop: 15, constantSeparator: 12, separatorColor: .systemGray6, constantIconRight: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(iconName: "chevron.right", iconColor: .black, iconSize: 13, iconWeight: .light, text: "Добавки", textSize: 14, textWeight: .semibold)
        view.actionHandler = { action in
            switch action{
            case .click:
                self.actionHandler(.additives)
            }
        }
        return view
    }()
    
    private lazy var ice: SegmentedControlView = {
        let view = SegmentedControlView(top:15, bottom: 12, left: 0, right: 0, separatorLeft: 0, separatorRight: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(actions: [
            UIImage(named: "ice1")!,
            UIImage(named: "ice2")!,
            UIImage(named: "ice3")!,
        ], selectedIndex: 0, title: "Лёд")
        view.actionHandler = { index in
            self.actionHandler(.ice(index))
            print(index)
        }
        view.alignmentElements = .bottom
        view.spacing = 25
        view.separatorHide = true
        return view
    }()
    
    private lazy var footerView: ConstructorFooterView = {
        let view = ConstructorFooterView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.price = "BYN 9.00"
        view.actionHandler = { _ in
            self.actionHandler(.next)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(headerView)
        addSubview(footerView)
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        
    }
    
    override func setupLayout() {
        super.setupLayout()
        
        headerView.topAnchor ~= safeAreaLayoutGuide.topAnchor
        headerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor
        headerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor
        
        
        scrollView.topAnchor ~= headerView.bottomAnchor + 27
        scrollView.bottomAnchor ~= footerView.topAnchor - 10
        scrollView.leftAnchor ~= leftAnchor
        scrollView.rightAnchor ~= rightAnchor
        
        stackView.widthAnchor ~= scrollView.frameLayoutGuide.widthAnchor - 68
        stackView.topAnchor ~= scrollView.topAnchor
        stackView.bottomAnchor ~= scrollView.bottomAnchor
        stackView.leftAnchor ~= scrollView.leftAnchor + 28
        stackView.rightAnchor ~= scrollView.rightAnchor - 40
        
        footerView.leftAnchor ~= safeAreaLayoutGuide.leftAnchor + 30
        footerView.rightAnchor ~= safeAreaLayoutGuide.rightAnchor - 30
        footerView.bottomAnchor <= bottomAnchor - 10
        let bottom = footerView.bottomAnchor ~= safeAreaLayoutGuide.bottomAnchor
        bottom.priority = .defaultHigh
    }
}
