//
//  CategoryViewController.swift
//  UIComponents
//
//  Created by Vadim Mukhin on 04.09.2021.
//

import UIKit

class CategoryViewController: UIViewController {
    var itemsProvider: ItemsProvider = EmptyProvider()

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        view.dataSource = self
        view.rowHeight = UITableView.automaticDimension
        view.allowsSelection = false
        view.delaysContentTouches = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(tableView)

        tableView.pinToSuperview()
    }
}

class CellConfig: UIContentConfiguration {
    var view: UIView

    init(view: UIView) {
        self.view = view
    }

    func updated(for state: UIConfigurationState) -> Self {
        self
    }

    func makeContentView() -> UIView & UIContentView {
        CellContentView(config: self)
    }
}

extension CategoryViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        itemsProvider.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.contentConfiguration = CellConfig(view: itemsProvider.item(at: indexPath.row))
        return cell
    }
}

class CellContentView: UIView, UIContentView {
    var configuration: UIContentConfiguration {
        didSet {
            update()
        }
    }

    init(config: UIContentConfiguration) {
        self.configuration = config
        super.init(frame: .zero)
        update()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func update() {
        guard let config = configuration as? CellConfig else { return }
        let view = config.view
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        view.pinToSuperview()
    }
}

