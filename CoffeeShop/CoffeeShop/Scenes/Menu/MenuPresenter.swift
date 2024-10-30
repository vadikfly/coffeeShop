//
//  MenuPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class MenuPresenter {
    weak var view: MenuDisplayLogic?

    init(view: MenuDisplayLogic) {
        self.view = view
    }
}

extension MenuPresenter: MenuPresentationLogic {
    func present(_ response: Menu.Fetch.Response) {
        view?.display(
            Menu.Fetch.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: Menu.Select.Response) {
        view?.display(Menu.Select.ViewModel())
    }
    
    func present(_ response: Menu.Profile.Response) {
        view?.display(Menu.Profile.ViewModel())
    }
    
    func present(_ response: Menu.Cart.Response) {
        view?.display(Menu.Cart.ViewModel())
    }
}

private extension Menu.Model {
    func rootViewModel() -> Menu.RootViewModel {
        .init(
            name: name,
            items: items.map { item in
                    .init(
                        name: item.string(),
                        image: item.imageMenu()
                    )
            }
        )
    }
}

extension Coffee {
    func imageMenu() -> String {
        switch self {
        case .americano:
            return "Americano"
        case .latte:
            return "Latte"
        case .raf:
            return "Raf"
        case .capucino:
            return "Capucino"
        case .flatwhite:
            return "FlatWhite"
        case .espresso:
            return "Espresso"
        }
    }
}
