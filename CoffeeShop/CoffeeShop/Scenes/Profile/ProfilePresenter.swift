//
//  ProfilePresenter.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

final class ProfilePresenter {
    weak var view: ProfileDisplayLogic?

    init(view: ProfileDisplayLogic) {
        self.view = view
    }
}

private var isEditing: Profile.FieldsEditing = .init(
    name: false,
    phone: false,
    email: false
)

extension ProfilePresenter: ProfilePresentationLogic {
    
    func present(_ response: Profile.Fetch.Response) {
        view?.display(
            Profile.Fetch.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: Profile.Close.Response) {
        view?.display(Profile.Close.ViewModel())
    }
    
    func present(_ response: Profile.EditingName.Response) {
        isEditing = .init(
            name: !isEditing.name,
            phone: false,
            email: false
        )
        view?.display(
            Profile.EditingName.ViewModel(
                isEditing: isEditing
            )
        )
    }
    
    func present(_ response: Profile.EditingPhone.Response) {
        isEditing = .init(
            name: false,
            phone: !isEditing.phone,
            email: false
        )
        view?.display(
            Profile.EditingPhone.ViewModel(
                isEditing: isEditing
            )
        )
    }
    
    func present(_ response: Profile.EditingEmail.Response) {
        isEditing = .init(
            name: false,
            phone: false,
            email: !isEditing.email
        )
        view?.display(
            Profile.EditingEmail.ViewModel(
                isEditing: isEditing
            )
        )
    }
    
    func present(_ response: Profile.EditingAddress.Response) {
        view?.display(
            Profile.EditingAddress.ViewModel(
                address: response.address.map { item in
                    item.string()
                }
            )
        )
    }
    
    func present(_ response: Profile.EditingEnd.Response) {
        view?.display(
            Profile.EditingEnd.ViewModel(
                isEditing: isEditing
            )
        )
    }
    
    func present(_ response: Profile.TextName.Response) {
        view?.display(
            Profile.TextName.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: Profile.TextPhone.Response) {
        view?.display(
            Profile.TextPhone.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: Profile.TextEmail.Response) {
        view?.display(
            Profile.TextEmail.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
    
    func present(_ response: Profile.ApplyAddress.Response) {
        view?.display(
            Profile.ApplyAddress.ViewModel(
                root: response.model.rootViewModel()
            )
        )
    }
}

private extension Profile.Model {
    func rootViewModel() -> Profile.RootViewModel {
        .init(
            profile: .init(
                name: profile.name,
                phoneNumber: profile.phoneNumber,
                email: profile.email,
                adress: profile.address.string()
            ), shopAddress: shopAddress.map { item in
                item.string()
            }
        )
    }
}

extension ProfileUser.CoffeShopAddress {
    func string() -> String {
        switch self {
        case .timiryazeva:
            return "г. Минск, ул. Тимирязева, 67"
        case .calvarijskaya:
            return "г. Минск, ул. Кальварийская, 58"
        case .melnikajte:
            return "г. Минск, ул. Мельникайте, 15"
        }
    }
}
