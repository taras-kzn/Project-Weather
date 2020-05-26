//
//  WeatherCollectionViewCell.swift
//  Project-Weather
//
//  Created by admin on 31.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var weatherLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
           super.awakeFromNib()
            
        configView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        

    }

    
    func configView() {
        iconImage.layer.masksToBounds = true
        iconImage.layer.shadowOpacity = 0.9
        iconImage.layer.cornerRadius = 15
        weatherLabel.layer.shadowOffset = .zero
        weatherLabel.layer.shadowOpacity = 0.15
        weatherLabel.backgroundColor = .clear
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.shadowOpacity = 0.5
        layer.shadowOffset = .zero
    }
}
