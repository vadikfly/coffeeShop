//
//  RegistrationWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class RegistrationWorker: RegistrationWorkingLogic {
    func fetch(_ completion: Registration.FetchCompletion?) {
        let model = Registration.Model(
            showPassword: true
        )
        completion?(
            .success(
                model
            )
        )
        completion?(.failure(RegistrationError.unknown))
    }
}

enum RegistrationError: Error {
    case unknown
}
