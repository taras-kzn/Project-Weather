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
    let weacherService = WeatherService()
    var weathers = [Weather]()
    let dateFormatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        weacherService.loadWeatherData(city: "Moscow", completion: { [weak self] weathers in
            self?.weathers = weathers
            self?.collectionView.reloadData()
            
        })
    }
}

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weathers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: id, for: indexPath) as! WeatherCollectionViewCell
        
        let weather = weathers[indexPath.row]
        cell.configure(whithWeather: weather)
        
        return cell
    }

}
