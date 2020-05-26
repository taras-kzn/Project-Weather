//
//  AllCityesTableViewCell.swift
//  Project-Weather
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class AllCityesTableViewCell: UITableViewCell {

    
    
    
    @IBOutlet var iconView: UIView!
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var cityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cityLabel.text = nil
        iconImageView.image = nil
    }
    
    func configure(city: String, image: UIImage?) {
        cityLabel.text = city
        iconImageView.image = image
        
        //backgroundColor = .black
    }
    
    override func layoutIfNeeded() {
        super.layoutIfNeeded()
        
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = iconImageView.frame.width / 2
        iconView.layer.cornerRadius = iconView.frame.width / 2
        //iconView.layer.shadowOpacity = 0.5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
