//
//  RootViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 02.09.2021.
//

import UIKit

class RootViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
        viewControllers = [StartupScreenBuilder.build()]
    }
}

