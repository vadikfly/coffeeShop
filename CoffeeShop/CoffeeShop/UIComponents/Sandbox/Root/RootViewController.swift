//
//  RootViewController.swift
//  UIComponents
//
//  Created by Vadim Mukhin on 04.09.2021.
//

import UIKit

class RootViewController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        viewControllers = [CategoriesViewController()]
    }
}
