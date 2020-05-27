//
//  WeatherCollectionViewCell.swift
//  Project-Weather
//
//  Created by admin on 31.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var weatherView: UIView!
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configView()
    }
    
    func configView() {
        weatherView.layer.cornerRadius = 30
        weatherView.layer.shadowOpacity = 0.7
        weatherLabel.clipsToBounds = true
        weatherLabel.backgroundColor = .white
        weatherLabel.layer.cornerRadius = 30
        iconImage.layer.cornerRadius = 15
    }
    
}
