//
//  ProfileInteractor.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class ProfileInteractor {
    private let presenter: ProfilePresentationLogic
    private let worker: ProfileWorkingLogic
    
    private var model: Profile.Model?

    init(presenter: ProfilePresentationLogic, worker: ProfileWorkingLogic) {
        self.presenter = presenter
        self.worker = worker
    }
}

extension ProfileInteractor: ProfileBusinessLogic {
    
    func request(_ request: Profile.Fetch.Request) {
        worker.fetch { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Profile.Fetch.Response(model: model))
            }
        }
    }
    
    func request(_ request: Profile.Close.Request) {
        presenter.present(Profile.Close.Response())
    }
    
    func request(_ request: Profile.EditingName.Request) {
        presenter.present(Profile.EditingName.Response())
    }
    
    func request(_ request: Profile.EditingPhone.Request) {
        presenter.present(Profile.EditingPhone.Response())
    }
    
    func request(_ request: Profile.EditingEmail.Request) {
        presenter.present(Profile.EditingEmail.Response())
    }
    
    func request(_ request: Profile.EditingAddress.Request) {
        guard let model = model else { return }
        presenter.present(Profile.EditingAddress.Response(address: model.shopAddress))
    }
    
    func request(_ request: Profile.EditingEnd.Request) {
        presenter.present(Profile.EditingEnd.Response())
    }
    
    func request(_ request: Profile.TextName.Request) {
        worker.name(request.text) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Profile.TextName.Response(model: model))
            }
        }
    }
    
    func request(_ request: Profile.TextPhone.Request) {
        worker.phone(request.text) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Profile.TextPhone.Response(model: model))
            }
        }
    }
    
    func request(_ request: Profile.TextEmail.Request) {
        worker.email(request.text) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Profile.TextEmail.Response(model: model))
            }
        }
    }
    
    func request(_ request: Profile.ApplyAddress.Request) {
        worker.address(request.index) { [weak self] model in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.model = model
                self.presenter.present(Profile.ApplyAddress.Response(model: model))
            }
        }
    }
}

extension ProfileInteractor: ProfileDataStore {}
