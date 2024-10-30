//
//  DesignerViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class DesignerViewController: UIViewController {
    var interactor: DesignerBusinessLogic?
    var router: DesignerRoutingLogic?
    
    private let rootView = DesignerView()
    
    override func loadView() {
        super.loadView()
        view = rootView
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(Designer.Close.Request())
            case .buy:
                self.interactor?.request(Designer.Buy.Request())
            case .chooseBarista:
                self.interactor?.request(Designer.ChooseBarista.Request())
            case .coffeTypeValue(let value):
                self.interactor?.request(Designer.CoffeTypeValue.Request(value: value))
            case .coffeeVariety:
                self.interactor?.request(Designer.СoffeeVariety.Request())
            case .roasting(let index):
                self.interactor?.request(Designer.Roasting.Request(index: index))
            case .grinding(let index):
                self.interactor?.request(Designer.Grinding.Request(index: index))
            case .chooseMilk:
                self.interactor?.request(Designer.ChooseMilk.Request())
            case .chooseSyrup:
                self.interactor?.request(Designer.ChooseSyrup.Request())
            case .additives:
                self.interactor?.request(Designer.Additives.Request())
            case .ice(let index):
                self.interactor?.request(Designer.Ice.Request(index: index))
            case .next:
                self.interactor?.request(Designer.Next.Request())
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Designer.Fetch.Request())
    }
    
    private func showAlert(message: String?, values: [String], completion: @escaping (Int) -> Void) { //11. values взяли из viewModel снизу
        let alert = UIAlertController(
            title: "",
            message: message,
            preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        cancel.setValue(UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1), forKey: "titleTextColor")
        alert.addAction(cancel)
        for index in 0..<values.count {
            let value = values[index]
            let action = UIAlertAction(title: value, style: .default) { _ in
                completion(index)
            }
            action.setValue(UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1), forKey: "titleTextColor")
            alert.addAction(action)
        }
        self.present(alert, animated: true)
    }
}

extension DesignerViewController: DesignerDisplayLogic {

    func display(_ viewModel: Designer.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Designer.Close.ViewModel) {
        router?.close()
    }
    
    func display(_ viewModel: Designer.Buy.ViewModel) {
        router?.buy()
    }
    
    func display(_ viewModel: Designer.ChooseBarista.ViewModel) {
        router?.chooseBarista()
    }
    
    func display(_ viewModel: Designer.CoffeTypeValue.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Designer.СoffeeVariety.ViewModel) {
        router?.coffeeVariety()
    }
    
    func display(_ viewModel: Designer.Roasting.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Designer.Grinding.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Designer.ChooseMilk.ViewModel) {
        showAlert(message: "Какой тип молока вы предпочитаете?", values: viewModel.milks) { index in
            self.interactor?.request(Designer.ApplyMilk.Request(index: index))
        }
    }
    
    func display(_ viewModel: Designer.ApplyMilk.ViewModel) {
        rootView.viewModel = viewModel.current
    }
    
    func display(_ viewModel: Designer.ChooseSyrup.ViewModel) {
        showAlert(message: "Какой сироп вы предпочитаете?", values: viewModel.syrupsView) { index in
            self.interactor?.request(Designer.ApplySyrup.Request(index: index))
        }
    }
    
    func display(_ viewModel: Designer.ApplySyrup.ViewModel) {
        rootView.viewModel = viewModel.current
    }
    
    func display(_ viewModel: Designer.Additives.ViewModel) {
        router?.additives()
    }
    
    func display(_ viewModel: Designer.Ice.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Designer.Next.ViewModel) {
        router?.next()
    }
}
