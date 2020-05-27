//
//  AllCityesViewController.swift
//  Project-Weather
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


protocol AddCityProtocol: class {
    func addCity(city: String)
}

class AllCityesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let cityesArray = [(city: "Москва", image: #imageLiteral(resourceName: "nssl0046")),
                               (city: "Казань", image: #imageLiteral(resourceName: "nssl0043")),
                               (city: "Питер", image: #imageLiteral(resourceName: "nssl0033")),
                               (city: "Екатеренбург", image: #imageLiteral(resourceName: "nssl0046")),
                               (city: "Сочи", image: #imageLiteral(resourceName: "nssl0042"))
    ]
    
    var cityDelegate: AddCityProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyCitiesTableViewCell", bundle: nil), forCellReuseIdentifier: MyCitiesTableViewCell.cityCellID)

    }
}

extension AllCityesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCitiesTableViewCell.cityCellID, for: indexPath) as! MyCitiesTableViewCell
        
        let array = cityesArray[indexPath.row]
        cell.gonfigure(city: array.city, cityImage: array.image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectCity = cityesArray[indexPath.row]
        self.cityDelegate?.addCity(city: selectCity.city)
        navigationController?.popViewController(animated: true)
    }

}
