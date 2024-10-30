//
//  AdditivesPresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 29.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class AdditivesPresenter {
    weak var view: AdditivesDisplayLogic?

    init(view: AdditivesDisplayLogic) {
        self.view = view
    }
}

extension AdditivesPresenter: AdditivesPresentationLogic {
    func present(_ response: Additives.Fetch.Response) {
        view?.display(Additives.Fetch.ViewModel(
            root: response.model.viewModel()
            )
        )
    }
    func present(_ response: Additives.Close.Response) {
        view?.display(Additives.Close.ViewModel())
    }
    func present(_ response: Additives.Buy.Response) {
        view?.display(Additives.Buy.ViewModel())
    }
    func present(_ response: Additives.SelectAdditives.Response) {
        view?.display(Additives.SelectAdditives.ViewModel(
            root: response.model.viewModel()
            )
        )
    }
    func present(_ response: Additives.ApplyAdditives.Response) {
        view?.display(Additives.ApplyAdditives.ViewModel())
    }
}

private extension Additives.Model {
    func viewModel() -> Additives.RootViewModel {
        .init(
            additivesItems: items.enumerated().map { index, item in
                    .init(
                        name: item.stringEngRus(),
                        isSelected: selected.contains(index)
                    )
            }
        )
    }
}
