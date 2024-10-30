//
//  ProfileWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 08.11.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

var profileNew: ProfileUser = .init(
    name: "Алексей",
    phoneNumber: "+7954321945",
    email: "aleksej@gmail.com",
    address: .calvarijskaya
)

private var shopAddress: [ProfileUser.CoffeShopAddress] = ProfileUser.CoffeShopAddress.allCases

private var profile: ProfileUser {
    get {
        guard let new = SharedProfile.shared.profile else {
            SharedProfile.shared.profile = profileNew
            return profileNew
        }
        return new
    }
    set {
        SharedProfile.shared.profile = newValue
    }
}

final class ProfileWorker: ProfileWorkingLogic {
    
    func fetch(_ completion: Profile.Completion?) {
        let model = Profile.Model(
            profile: profile,
            shopAddress: shopAddress
        )
        completion?(model)
    }
    
    func address(_ index: Int, _ completion: Profile.Completion?) {
        profile = .init(
            name: profile.name,
            phoneNumber: profile.phoneNumber,
            email: profile.email,
            address: shopAddress[index]
        )
        let model = Profile.Model(
            profile: profile,
            shopAddress: shopAddress
        )
        completion?(model)
    }
    
    func name(_ name: String, _ completion: Profile.Completion?) {
        profile = .init(
            name: name,
            phoneNumber: profile.phoneNumber,
            email: profile.email,
            address: profile.address
        )
        let model = Profile.Model(
            profile: profile,
            shopAddress: shopAddress
        )
        completion?(model)
    }
    
    func phone(_ phone: String, _ completion: Profile.Completion?) {
        profile = .init(
            name: profile.name,
            phoneNumber: phone,
            email: profile.email,
            address: profile.address
        )
        let model = Profile.Model(
            profile: profile,
            shopAddress: shopAddress
        )
        completion?(model)
    }
    
    func email(_ email: String, _ completion: Profile.Completion?) {
        profile = .init(
            name: profile.name,
            phoneNumber: profile.phoneNumber,
            email: email,
            address: profile.address
        )
        let model = Profile.Model(
            profile: profile,
            shopAddress: shopAddress
        )
        completion?(model)
    }
}
