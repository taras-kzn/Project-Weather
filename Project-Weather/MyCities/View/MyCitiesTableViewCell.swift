//
//  MyCitiesTableViewCell.swift
//  Project-Weather
//
//  Created by admin on 26.05.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

class MyCitiesTableViewCell: UITableViewCell {

    static let reuseid = "MyCitiesTableViewCell"
    
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var iconView: UIView!
    @IBOutlet var iconImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        iconImageView.image = nil
        cityLabel.text = nil
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconView.layer.cornerRadius = iconView.frame.width / 2
        //iconView.layer.shadowOpacity = 0.5
    }
    
    func configure(city: String, image: UIImage?) {
        cityLabel.text = city
        iconImageView.image = image
    }
    
}
