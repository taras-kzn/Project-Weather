//
//  WeatherViewController.swift
//  Project-Weather
//
//  Created by admin on 31.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {


    @IBOutlet weak var selectDayView: UIView!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let id = "WeatherCollectionViewCell"
    
    private let image = "45"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self

    }

}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! WeatherCollectionViewCell
        
        cell.iconImage.image = UIImage(named: image)
        cell.weatherLabel.text = "30 C"
        cell.timeLabel.text = "30.08.2017 18:00"
        
        return cell
    }

}
