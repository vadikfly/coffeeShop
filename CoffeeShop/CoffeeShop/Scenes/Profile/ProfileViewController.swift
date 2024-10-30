//
//  ProfileViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class ProfileViewController: UIViewController {
    var interactor: ProfileBusinessLogic?
    var router: ProfileRoutingLogic?

    private lazy var rootView = ProfileView()

    override func loadView() {
        super.loadView()
        view = rootView
        
        rootView.actionHandler = { action in
            switch action {
            case .close:
                self.interactor?.request(Profile.Close.Request())
            case .text(let text):
                switch text {
                case .name(let text):
                    self.interactor?.request(Profile.TextName.Request(text: text))
                case .phone(let text):
                    self.interactor?.request(Profile.TextPhone.Request(text: text))
                case .email(let text):
                    self.interactor?.request(Profile.TextEmail.Request(text: text))
                }
            case .edit(let edit):
                switch edit {
                case .name:
                    self.interactor?.request(Profile.EditingName.Request())
                case .phone:
                    self.interactor?.request(Profile.EditingPhone.Request())
                case .email:
                    self.interactor?.request(Profile.EditingEmail.Request())
                case .address:
                    self.interactor?.request(Profile.EditingAddress.Request())
                }
            case .editEnd:
                self.interactor?.request(Profile.EditingEnd.Request())
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.interactor?.request(Profile.Fetch.Request())
    }
    
    private func showAlert(items: [String]) {
        let alert = UIAlertController(
            title: "",
            message: "Выберите адрес кофейни",
            preferredStyle: .actionSheet)
        let cancel = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        cancel.setValue(UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1), forKey: "titleTextColor")
        alert.addAction(cancel)
        
        for index in 0..<items.count {
            let syrup = items[index]
            let action = UIAlertAction(title: syrup, style: .default) { _ in
                self.interactor?.request(Profile.ApplyAddress.Request(index: index))
            }
            action.setValue(UIColor(red: 0, green: 0.094, blue: 0.2, alpha: 1), forKey: "titleTextColor")
            alert.addAction(action)
        }
        self.present(alert, animated: true)
    }
}

extension ProfileViewController: ProfileDisplayLogic {
    
    func display(_ viewModel: Profile.Fetch.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    
    func display(_ viewModel: Profile.Close.ViewModel) {
        router?.close()
    }
    
    func display(_ viewModel: Profile.EditingName.ViewModel) {
        rootView.editingViewModel = viewModel.isEditing
    }
    
    func display(_ viewModel: Profile.EditingPhone.ViewModel) {
        rootView.editingViewModel = viewModel.isEditing
    }
    
    func display(_ viewModel: Profile.EditingEmail.ViewModel) {
        rootView.editingViewModel = viewModel.isEditing
    }
    
    func display(_ viewModel: Profile.EditingAddress.ViewModel) {
        showAlert(items: viewModel.address)
    }
    
    func display(_ viewModel: Profile.EditingEnd.ViewModel) {
        rootView.editingViewModel = viewModel.isEditing
    }
    
    func display(_ viewModel: Profile.TextName.ViewModel) {
        //
    }
    
    func display(_ viewModel: Profile.TextPhone.ViewModel) {
        //
    }
    
    func display(_ viewModel: Profile.TextEmail.ViewModel) {
        //
    }
    
    func display(_ viewModel: Profile.ApplyAddress.ViewModel) {
        rootView.viewModel = viewModel.root
    }
    

}
