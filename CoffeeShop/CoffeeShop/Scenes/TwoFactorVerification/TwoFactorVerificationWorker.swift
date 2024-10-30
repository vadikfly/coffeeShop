//
//  TwoFactorVerificationWorker.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 11.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

final class TwoFactorVerificationWorker: TwoFactorVerificationWorkingLogic {
    
    func fetch(_ completion: TwoFactorVerification.FetchCompletion?) {
            let model = TwoFactorVerification.Model()
            completion?(.success(model)
            )
        }
}
