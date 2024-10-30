//
//  DesignerProtocols.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 13.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

protocol DesignerBusinessLogic: AnyObject {
    func request(_ request: Designer.Fetch.Request)
    func request(_ request: Designer.Close.Request)
    func request(_ request: Designer.Buy.Request)
    func request(_ request: Designer.ChooseBarista.Request)
    func request(_ request: Designer.CoffeTypeValue.Request)
    func request(_ request: Designer.СoffeeVariety.Request)
    func request(_ request: Designer.Roasting.Request)
    func request(_ request: Designer.Grinding.Request)
    func request(_ request: Designer.ChooseMilk.Request)
    func request(_ request: Designer.ApplyMilk.Request)
    func request(_ request: Designer.ChooseSyrup.Request)
    func request(_ request: Designer.ApplySyrup.Request)
    func request(_ request: Designer.Additives.Request)
    func request(_ request: Designer.Ice.Request)
    func request(_ request: Designer.Next.Request)
}

protocol DesignerPresentationLogic: AnyObject {
    func present(_ response: Designer.Fetch.Response)
    func present(_ response: Designer.Close.Response)
    func present(_ response: Designer.Buy.Response)
    func present(_ response: Designer.ChooseBarista.Response)
    func present(_ response: Designer.CoffeTypeValue.Response)
    func present(_ response: Designer.СoffeeVariety.Response)
    func present(_ response: Designer.Roasting.Response)
    func present(_ response: Designer.Grinding.Response)
    func present(_ response: Designer.ChooseMilk.Response)
    func present(_ response: Designer.ApplyMilk.Response)
    func present(_ response: Designer.ChooseSyrup.Response)
    func present(_ response: Designer.ApplySyrup.Response)
    func present(_ response: Designer.Additives.Response)
    func present(_ response: Designer.Ice.Response)
    func present(_ response: Designer.Next.Response)
}

protocol DesignerDisplayLogic: AnyObject {
    func display(_ viewModel: Designer.Fetch.ViewModel)
    func display(_ viewModel: Designer.Close.ViewModel)
    func display(_ viewModel: Designer.Buy.ViewModel)
    func display(_ viewModel: Designer.ChooseBarista.ViewModel)
    func display(_ viewModel: Designer.CoffeTypeValue.ViewModel)
    func display(_ viewModel: Designer.СoffeeVariety.ViewModel)
    func display(_ viewModel: Designer.Roasting.ViewModel)
    func display(_ viewModel: Designer.Grinding.ViewModel)
    func display(_ viewModel: Designer.ChooseMilk.ViewModel)
    func display(_ viewModel: Designer.ApplyMilk.ViewModel)
    func display(_ viewModel: Designer.ChooseSyrup.ViewModel)
    func display(_ viewModel: Designer.ApplySyrup.ViewModel)
    func display(_ viewModel: Designer.Additives.ViewModel)
    func display(_ viewModel: Designer.Ice.ViewModel)
    func display(_ viewModel: Designer.Next.ViewModel)
}

protocol DesignerRoutingLogic: AnyObject {
    func close()
    func buy()
    func chooseBarista()
    func coffeeVariety()
    func additives()
    func next()
}

protocol DesignerDataStore: AnyObject {
}

protocol DesignerWorkingLogic: AnyObject {
    func fetch(_ completion: Designer.Completion?)
    func сoffeTypeValue(_ coffeeTypeValue: Float, _ completion: Designer.CurrentCompletion?)
    func roasting(_ roasting: Int, _ completion: Designer.CurrentCompletion?)
    func grinding(_ grinding: Int, _ completion: Designer.CurrentCompletion?)
    func milk(_ milk: Milk, _ completion: Designer.CurrentCompletion?)
    func syrup(_ syrup: Syrup, _ completion: Designer.CurrentCompletion?)
    func ice(_ ice: Int, _ completion: Designer.CurrentCompletion?)
}

