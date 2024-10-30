//
//  SimpleTableView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 19.10.2021.
//

import UIKit

protocol SimpleContentCell: UIView {
    associatedtype DataType
    var viewModel: DataType? { get set }
}

class SimpleTableView<T: SimpleContentCell>: View, UITableViewDataSource, UITableViewDelegate {
    enum Action {
        case select(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    var items: [T.DataType] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(Cell.self, forCellReuseIdentifier: "Cell")
        view.delegate = self
        view.dataSource = self
        view.separatorStyle = .none
        view.allowsMultipleSelection = false
        view.rowHeight = UITableView.automaticDimension
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(tableView)
    }

    override func setupLayout() {
        super.setupLayout()
        tableView.pinToSuperview()
    }

    private class Cell: UITableViewCell {
        let customContentView: T = {
            let view = T()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()

        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupContent()
            setupLayout()
        }

        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        func setupContent() {
            contentView.addSubview(customContentView)
            selectionStyle = .none
        }

        func setupLayout() {
            customContentView.pinToSuperview()
        }
    }

    // MARK: - Table Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! Cell
        cell.customContentView.viewModel = items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        actionHandler(.select(indexPath.row))
    }
}
