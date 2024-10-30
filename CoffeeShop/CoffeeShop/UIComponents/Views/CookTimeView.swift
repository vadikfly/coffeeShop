//
//  CookTimeView.swift
//  CoffeeShop
//
//  Created by Vadim Mukhin on 09.09.2021.
//

import UIKit

class CookTimeView: View {
    
    enum Action {
        case cookSwitch(Bool)
        case cookTime(Date)
    }
    var actionHandler: (Action) -> Void = { _ in }
    
    var cookSwitch: Bool? {
        didSet {
            cookSwitchUI.isOn = cookSwitch ?? false
            timePicker.isHidden = !(cookSwitch ?? false)
        }
    }

    var cookTime: Date? {
        didSet {
            timePicker.date = cookTime ?? Date()
        }
    }
    
    var minuteInterval: Int? {
        didSet {
            timePicker.minuteInterval = minuteInterval ?? 0
        }
    }
    
    private let titleLabel: Label = {
        let view = Label(size: 14, weight: .medium)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.viewModel = .init(text: "Приготовить к определенному времени сегодня?", textAlignment: .left, textColor: .black)
        view.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        view.setContentHuggingPriority(.defaultLow, for: .horizontal)
        return view
    }()
    
    private lazy var cookSwitchUI: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addAction(
            UIAction(
                handler: { _ in
                    self.actionHandler(.cookSwitch(view.isOn))
                }
            ),
            for: .valueChanged
        )
        return view
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.datePickerMode = .time
        view.timeZone = TimeZone.current
        view.locale = Locale(identifier: "ru_RU")
        view.subviews.first?.subviews.last?.backgroundColor = UIColor(red: 0.463, green: 0.463, blue: 0.502, alpha: 0.12)
        view.tintColor = .black
        view.addAction(
            UIAction(
                handler: { _ in
                    if self.cookTime != nil {
                        self.actionHandler(.cookTime(view.date))
                    }
                }
            ),
            for: .valueChanged
        )
        return view
    }()

    override func setupContent() {
        super.setupContent()
        addSubview(titleLabel)
        addSubview(cookSwitchUI)
        addSubview(timePicker)
    }
    
    override func setupLayout() {
        super.setupLayout()
        titleLabel.leftAnchor ~= leftAnchor + 10
        titleLabel.rightAnchor ~= cookSwitchUI.leftAnchor
        titleLabel.centerYAnchor ~= cookSwitchUI.centerYAnchor
        
        cookSwitchUI.topAnchor ~= topAnchor + 6
        cookSwitchUI.rightAnchor ~= rightAnchor - 7
        
        timePicker.topAnchor ~= cookSwitchUI.bottomAnchor + 16
        timePicker.rightAnchor ~= rightAnchor - 7
        timePicker.bottomAnchor ~= bottomAnchor
        timePicker.heightAnchor ~= 36
        timePicker.widthAnchor ~= 86
    }
}

