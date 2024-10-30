//
//  CategoriesViewController.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 04.09.2021.
//

import UIKit

class CategoriesViewController: UIViewController {
    var items: [Category] = Category.allCases

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.dataSource = self
        view.delegate = self
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Select Category"
        view.addSubview(tableView)

        tableView.pinToSuperview()
    }
}

extension CategoriesViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = items[indexPath.row].rawValue.uppercased()
        cell.contentConfiguration = config
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let category = CategoryViewController()
        category.itemsProvider = items[indexPath.row].provider
        navigationController?.pushViewController(category, animated: true)
    }
}
