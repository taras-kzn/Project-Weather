//
//  SelectDayControl.swift
//  Project-Weather
//
//  Created by admin on 18.11.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

enum Day: Int, CaseIterable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var title: String {
        switch self {
        case .monday: return "Пн"
        case .tuesday: return "Вт"
        case .wednesday: return "Ср"
        case .thursday: return "Чт"
        case .friday: return "Пт"
        case .saturday: return "Сб"
        case .sunday: return "Вс"
            
        }
    }
}

class SelectDayControl: UIControl {
    
    var selectDay: Day? {
        didSet {
            updateSelectedDay()
            sendActions(for: .valueChanged)
        }
    }
    
    var dayButtons: [UIButton] = []
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
         super.init(frame: frame)
        self.setupView()
    }
        
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }

    private func setupView() {
        for day in Day.allCases {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectedDay(_:)), for: .touchUpInside)
            dayButtons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: dayButtons)
        stackView.spacing = 8
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        addSubview(stackView)
    }
    
    private func updateSelectedDay() {
        for (index, button) in dayButtons.enumerated() {
            guard let day = Day(rawValue: index) else {continue}
            button.isSelected = day == selectDay
        }
    }
    
    @objc private func selectedDay(_ sender: UIButton) {
        guard  let index = dayButtons.index(of: sender) else {
            return
        }
        guard let day = Day.init(rawValue: index) else {
            return
        }
        selectDay = day
    }
}
