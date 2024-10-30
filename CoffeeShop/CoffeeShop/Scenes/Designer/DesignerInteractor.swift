//
//  DesignerInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class DesignerInteractor {
    private let presenter: DesignerPresentationLogic
    private let worker: DesignerWorkingLogic
    private var model: Designer.Model?
    private var orderItem: OrderItem?
    private var milks: [Milk] = Milk.allCases
    private var syrups: [Syrup] = Syrup.allCases

    init(presenter: DesignerPresentationLogic, worker: DesignerWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension DesignerInteractor: DesignerBusinessLogic {

    func request(_ request: Designer.Fetch.Request) {
        
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Designer.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: Designer.Close.Request) {
        presenter.present(Designer.Close.Response())
    }
    
    func request(_ request: Designer.Buy.Request) {
        presenter.present(Designer.Buy.Response())
    }
    
    func request(_ request: Designer.ChooseBarista.Request) {
        presenter.present(Designer.ChooseBarista.Response())
    }
    
    func request(_ request: Designer.CoffeTypeValue.Request) {
        worker.сoffeTypeValue(request.value) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(Designer.CoffeTypeValue.Response(model: model))
            }
        }
    }
    
    func request(_ request: Designer.СoffeeVariety.Request) {
        presenter.present(Designer.СoffeeVariety.Response())
    }
    
    func request(_ request: Designer.Roasting.Request) {
        worker.roasting(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(Designer.Roasting.Response(model: model))
            }
        }
    }
    
    func request(_ request: Designer.Grinding.Request) {
        worker.grinding(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(Designer.Grinding.Response(model: model))
            }
        }
    }
    
    func request(_ request: Designer.ChooseMilk.Request) {
        presenter.present(Designer.ChooseMilk.Response(milks: milks))
    }
    
    func request(_ request: Designer.ApplyMilk.Request) {
        worker.milk(milks[request.index]) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(Designer.ApplyMilk.Response(model: model))
            }
        }
    }
    
    func request(_ request: Designer.ChooseSyrup.Request) {
        presenter.present(Designer.ChooseSyrup.Response(syrups: syrups))
    }
    
    func request(_ request: Designer.ApplySyrup.Request) {
        worker.syrup(syrups[request.index]) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(Designer.ApplySyrup.Response(model: model))
            }
        }
    }
    
    
    func request(_ request: Designer.Additives.Request) {
        presenter.present(Designer.Additives.Response())
    }
    
    func request(_ request: Designer.Ice.Request) {
        worker.ice(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.orderItem = model
                self.presenter.present(Designer.Ice.Response(model: model))
            }
        }
    }
    
    func request(_ request: Designer.Next.Request) {
        presenter.present(Designer.Next.Response())
    }
}

extension DesignerInteractor: DesignerDataStore {}
