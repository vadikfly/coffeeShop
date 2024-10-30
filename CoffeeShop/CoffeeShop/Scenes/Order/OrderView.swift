//
//  OrderView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 05.09.2021.
//  Copyright (c) 2021. All rights reserved.
//

import UIKit

final class OrderView: View {
    
    enum Action {
        case current
        case history
        case buy(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    struct Model {
        let currentItems: [CurrentCell.Model]
        let historyItems: [HistoryCell.Model]
    }
    
    var viewModel: Model = .init(currentItems: [], historyItems: []) {
        didSet {
            currentDataSource.items = viewModel.currentItems
            historyDataSource.items = viewModel.historyItems
            tableView.reloadData()
        }
    }
    
    private lazy var currentDataSource: CurrentCellDataSource = {
        let dataSource = CurrentCellDataSource()
        return dataSource
    }()

    private lazy var historyDataSource: HistoryCellDataSource = {
        let dataSource = HistoryCellDataSource()
        dataSource.actionHandler = { action in
            switch action {
            case .buy(let index):
                self.actionHandler(.buy(index))
            }
        }
        return dataSource
    }()
   
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.register(CurrentCell.self, forCellReuseIdentifier: "CurrentCell")
        view.register(HistoryCell.self, forCellReuseIdentifier: "HistoryCell")
        view.dataSource = currentDataSource
        view.separatorStyle = .none
        view.allowsSelection = false
        view.rowHeight = UITableView.automaticDimension
        return view
    }()
    
    private lazy var control: OrderHeaderView = {
        let view = OrderHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(
            actions: [
                "Текущий",
                "История"
            ],
            selectedIndex: 0
        )
        view.actionHandler = { index in
            switch index {
            case 0:
                self.tableView.dataSource = self.currentDataSource
            case 1:
                self.tableView.dataSource = self.historyDataSource
            default:
                break
            }
            self.tableView.reloadData()
            print(index)
        }
        return view
    }()
    
    override func setupContent() {
        super.setupContent()
        backgroundColor = .white
        addSubview(tableView)
        addSubview(control)
    }

    override func setupLayout() {
        super.setupLayout()
        control.topAnchor ~= safeAreaLayoutGuide.topAnchor
        control.leftAnchor ~= leftAnchor
        control.rightAnchor ~= rightAnchor
        
        tableView.topAnchor ~= control.bottomAnchor
        tableView.leftAnchor ~= leftAnchor
        tableView.rightAnchor ~= rightAnchor
        tableView.bottomAnchor ~= bottomAnchor
    }
}

class CurrentCellDataSource: NSObject, UITableViewDataSource {
    var items: [CurrentCell.Model] = []

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrentCell", for: indexPath) as! CurrentCell
        cell.viewModel = items[indexPath.row]
        return cell
    }
}

class HistoryCellDataSource: NSObject, UITableViewDataSource {
    var items: [HistoryCell.Model] = []
    
    enum Action {
        case buy(Int)
    }
    var actionHandler: (Action) -> Void = { _ in }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        cell.viewModel = items[indexPath.row]
        cell.actionHandler = { action in
            switch action {
            case .buy:
                self.actionHandler(.buy(indexPath.row))
                print("zakaz \(indexPath.row)")
            }
        }
        return cell
    }
}

class CurrentCell: UITableViewCell {
    
    struct Model {
        let dateOrder: String?
        let coffee: String?
        let adress: String?
        let price: String?
    }

    var viewModel: Model = .init(dateOrder: nil, coffee: nil, adress: nil, price: nil) {
        didSet {
            currentView.viewModel = .init(dateOrder: viewModel.dateOrder, coffee: viewModel.coffee, adress: viewModel.adress, price: viewModel.price)
        }
    }
    
    private var currentView: OrderCurrentCell = {
        let view = OrderCurrentCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setup
        setupView()
        setupContent()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

    }

    func setupContent() {
        // add subviews
        contentView.addSubview(currentView)
    }

    func setupLayout() {
        currentView.topAnchor ~= contentView.topAnchor
        currentView.bottomAnchor ~= contentView.bottomAnchor
        currentView.leftAnchor ~= contentView.leftAnchor + 32
        currentView.rightAnchor ~= contentView.rightAnchor - 32
    }
}

class HistoryCell: UITableViewCell {
    
    enum Action {
        case buy
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    struct Model {
        let dateOrder: String?
        let coffee: String?
        let adress: String?
        let price: String?
    }

    var viewModel: Model = .init(dateOrder: nil, coffee: nil, adress: nil, price: nil) {
        didSet {
            historyView.viewModel = .init(dateOrder: viewModel.dateOrder, coffee: viewModel.coffee, adress: viewModel.adress, price: viewModel.price)
        }
    }
    
    private lazy var historyView: OrderHistoryCell = {
        let view = OrderHistoryCell()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.actionHandler = { action in
            switch action {
            case .buy:
                self.actionHandler(.buy)
            }
        }
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // setup
        setupView()
        setupContent()
        setupLayout()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {

    }

    func setupContent() {
        // add subviews
        contentView.addSubview(historyView)
    }

    func setupLayout() {
        historyView.topAnchor ~= contentView.topAnchor
        historyView.bottomAnchor ~= contentView.bottomAnchor
        historyView.leftAnchor ~= contentView.leftAnchor + 32
        historyView.rightAnchor ~= contentView.rightAnchor - 32
    }
}
