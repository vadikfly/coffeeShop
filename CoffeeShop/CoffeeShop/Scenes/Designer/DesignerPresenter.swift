//
//  DesignerPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class DesignerPresenter {
    weak var view: DesignerDisplayLogic?
    
    init(view: DesignerDisplayLogic) {
        self.view = view
    }
    
    private func chooseMilk( _ id: Milk) -> String {
        switch id {
        case .no:
            return "Нет"
        case .cow:
            return "Коровье"
        case .lactoseFree:
            return "Безлактозное"
        case .fatFree:
            return "Обезжиренное"
        case .vegetable:
            return "Растительное"
        }
    }
    
    private func chooseSyrup( _ id: Syrup) -> String {
        switch id {
        case .no:
            return "Нет"
        case .amaretto:
            return "Амаретто"
        case .coconut:
            return "Кокос"
        case .vanilla:
            return "Ваниль"
        case .caramel:
            return "Карамель"
        }
    }
}

extension DesignerPresenter: DesignerPresentationLogic {

    func present(_ response: Designer.Fetch.Response) {
        view?.display(
            Designer.Fetch.ViewModel(
                root: response.model.orderItem.currentViewModel()
            )
        )
    }
    
    func present(_ response: Designer.Close.Response) {
        view?.display(Designer.Close.ViewModel()
        )
    }
    
    func present(_ response: Designer.Buy.Response) {
        view?.display(Designer.Buy.ViewModel()
        )
    }
    
    func present(_ response: Designer.ChooseBarista.Response) {
        view?.display(Designer.ChooseBarista.ViewModel()
        )
    }
    
    func present(_ response: Designer.CoffeTypeValue.Response) {
        view?.display(
            Designer.CoffeTypeValue.ViewModel(
                root: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: Designer.СoffeeVariety.Response) {
        view?.display(Designer.СoffeeVariety.ViewModel()
        )
    }
    
    func present(_ response: Designer.Roasting.Response) {
        view?.display(
            Designer.Roasting.ViewModel(
                root: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: Designer.Grinding.Response) {
        view?.display(
            Designer.Grinding.ViewModel(
                root: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: Designer.ChooseMilk.Response) {
        view?.display(
            Designer.ChooseMilk.ViewModel(
                milks: response.milks.map { milk in
                    return chooseMilk(milk)
                }
            )
        )
    }
    
    func present(_ response: Designer.ApplyMilk.Response) {
        view?.display(
            Designer.ApplyMilk.ViewModel(
                current: response.model.currentViewModel()
            )
        )
    }
    
    func present(_ response: Designer.ChooseSyrup.Response) {
        view?.display(
            Designer.ChooseSyrup.ViewModel(
                syrupsView: response.syrups.map({ syrup in
                    return chooseSyrup(syrup)
                }
                                               )
            )
        )
    }
    
    func present(_ response: Designer.ApplySyrup.Response) {
        view?.display(
            Designer.ApplySyrup.ViewModel(
                current: response.model.currentViewModel()
            )
        )
    }
    
    
    func present(_ response: Designer.Additives.Response) {
        view?.display(Designer.Additives.ViewModel())
    }
    func present(_ response: Designer.Ice.Response) {
        view?.display(
            Designer.Ice.ViewModel(
                root: response.model.currentViewModel()
            )
        )
    }
    func present(_ response: Designer.Next.Response) {
        view?.display(Designer.Next.ViewModel()
        )
    }
}

private extension OrderItem {
    
    func currentViewModel() -> Designer.RootViewModel {
        
        .init(
            price: String(format: "BYN %.2f", Double(price)/100.0),
            coffeeTypeValue: coffeeType,
            roastingIndex: roasting,
            grindingIndex: grinding,
            iceIndex: ice,
            chooseMilkText: milk.string(),
            chooseSyrupText: chooseSyrup(syrup),
            baristaName: barista?.viewModel(),
            countryName: coffeeCountry(),
            additives: additivesTEST()
        )
    }
    
    func chooseSyrup( _ id: Syrup) -> String {
        switch id {
        case .no:
            return "Выбрать"
        case .amaretto:
            return "Амаретто"
        case .coconut:
            return "Кокос"
        case .vanilla:
            return "Ваниль"
        case .caramel:
            return "Карамель"
        }
    }
}

private extension Milk {
    func string() -> String {
        switch self {
        case .no:
            return "Выбрать"
        case .cow:
            return "Коровье"
        case .lactoseFree:
            return "Безлактозное"
        case .fatFree:
            return "Обезжиренное"
        case .vegetable:
            return "Растительное"
        }
    }
}

private extension Employee {
    func viewModel() -> String {
        "Напиток приготовит \(level.skill()), \(name)"
    }
}

private extension Employee.Level {
    func skill() -> String {
        switch self {
        case .low:
            return "Новичок"
        case .middle:
            return "Бариста"
        case .high:
            return "Топ-бариста"
        }
    }
}

extension OrderItem {
    func coffeeCountry() -> String {
        if coffeeVariety.isEmpty {
            return "Сорт"
        }
        else{
            let mappedVarieties = coffeeVariety.compactMap { variety -> String? in
                guard let variety = variety else { return nil }
                return variety
            }
            return "Страна: " + mappedVarieties.joined(separator: "\nСорт: ")
        }
    }
}

private extension OrderItem {
    func additivesTEST() -> String {
        if additives.count == 0 {
            return "Добавки"
        }
        else{
            return "Добавки: " + additivesStrings().sorted().joined(separator: ", ") 
        }
    }
}

extension AdditivesList {
    func stringEngRus() -> String {
        switch self {
        case .ceylon:
            return "Цейлонская корица"
        case .gratedСhocolate:
            return "Тертый шоколад"
        case .liquidChocolate:
            return "Жидкий шоколад"
        case .marshmallow:
            return "Маршмеллоу"
        case .whippedCream:
            return "Взбитые сливки"
        case .cream:
            return "Сливки"
        case .muscatNut:
            return "Мускатный орех"
        case .iceCream:
            return "Мороженное"
        }
    }
}

extension OrderItem {
    func additivesStrings() -> [String] {
        additives.map { item in
            switch item {
            case 0:
                return "Цейлонская корица"
            case 1:
                return "Тертый шоколад"
            case 2:
                return "Жидкий шоколад"
            case 3:
                return "Маршмеллоу"
            case 4:
                return "Взбитые сливки"
            case 5:
                return "Сливки"
            case 6:
                return "Мускатный орех"
            case 7:
                return "Мороженное"
            default:
                return ""
            }
        }
    }
}
