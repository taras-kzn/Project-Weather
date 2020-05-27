//
//  MyCitiesTableViewCell.swift
//  Project-Weather
//
//  Created by admin on 27.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MyCitiesTableViewCell: UITableViewCell {
    
    static let cityCellID = "MyCitiesTableViewCell"

    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var iconView: UIView!
    @IBOutlet var cityImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        cityLabel.text = nil
        cityImageView.image = nil
    }
    
    func gonfigure(city: String, cityImage: UIImage?) {
        cityLabel.text = city
        cityImageView.image = cityImage
    }
    
    func configView() {
        iconView.layer.cornerRadius = iconView.frame.width / 2
        iconView.layer.shadowOpacity = 0.5
        cityImageView.layer.cornerRadius = cityImageView.frame.width / 2
        cityImageView.layer.masksToBounds = true
    }
}
