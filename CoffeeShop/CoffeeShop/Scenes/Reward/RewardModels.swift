//
//  RewardModels.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 03.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import Foundation

enum Reward {
    enum Fetch {
        struct Request {}
        
        struct Response {
            var model: Reward.Model
        }
        
        struct ViewModel {
            var fetchViewModel: Reward.ViewModel
        }
    }
    
    enum PayByPoints {
        struct Request {}
        
        struct Response {}
        
        struct ViewModel {}
        
    }
    
    struct Model {
        let totalCupCount: Int
        let currentCupCount: Int
        let bonusPoints: Int
    }
    
    struct ViewModel {
        var totalCupCount: Int
        var currentCupCount: Int
        var countText: String?
        var bonusPoints: String?
        
    }
    
    typealias FetchCompletion = (Reward.Model) -> Void
    
}
