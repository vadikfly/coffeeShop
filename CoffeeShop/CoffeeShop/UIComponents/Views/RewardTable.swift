//
//  RewardTable.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 16.09.2021.
//

import UIKit

class RewardTable: View {
    var items: [RewardCell.Model] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.register(RewardCell.self, forCellReuseIdentifier: "Cell")
        view.dataSource = self
        view.separatorStyle = .none
        view.allowsSelection = false
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
}

extension RewardTable: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RewardCell
        cell.viewModel = items[indexPath.row]
        return cell
    }
}


class RewardCell: UITableViewCell {
    
    struct Model {
        let coffeeName: String?
        let orderDate: String?
        let orderTime: String?
        let bonusPoints: Int?
        
    }
    var viewModel: Model = .init(coffeeName: "1111", orderDate: "2222", orderTime: "3333", bonusPoints: 5) {
        didSet {
            nameLabel.viewModel = .init(text: viewModel.coffeeName, textColor: .darkBlue)
            dateLabel.viewModel = .init(text: "\(viewModel.orderDate ?? "") | \(viewModel.orderTime ?? "")", textColor: .lightGray)
            scoresLabel.viewModel = .init(text: "+ \(viewModel.bonusPoints ?? 12) баллов", textColor: .darkBlue)
        }
    }
    
    private let nameLabel: Label = {
        let view = Label(size: 12, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateLabel: Label = {
        let view = Label(size: 10, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let scoresLabel: Label = {
        let view = Label(size: 16, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let separator: SeparatorView = {
        let view = SeparatorView(heigth: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = UIColor(red: 0.957, green: 0.961, blue: 0.969, alpha: 1)
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
        contentView.addSubview(nameLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(scoresLabel)
        contentView.addSubview(separator)
    }
    
    func setupLayout() {
        nameLabel.topAnchor ~= contentView.topAnchor + 16
        nameLabel.leftAnchor ~= contentView.leftAnchor + 31
        nameLabel.heightAnchor.constraint(equalToConstant: 18).isActive = true
        
        dateLabel.topAnchor ~= nameLabel.bottomAnchor + 5
        dateLabel.leftAnchor ~= nameLabel.leftAnchor
        dateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        scoresLabel.rightAnchor ~= contentView.rightAnchor - 25
        scoresLabel.centerYAnchor ~= nameLabel.bottomAnchor
        scoresLabel.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        separator.topAnchor ~= dateLabel.bottomAnchor + 20
        separator.rightAnchor ~= contentView.rightAnchor - 31
        separator.leftAnchor ~= contentView.leftAnchor + 31
        separator.bottomAnchor ~= contentView.bottomAnchor - 1
    }
}
