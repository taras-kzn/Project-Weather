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
    
    private let id = "AllCityesTableViewCell"
    var cityes = [(title: "Москва", image: UIImage(named: "45")),
    (title: "Казань", image: UIImage(named: "nssl0033")),
    (title: "Питер", image: UIImage(named: "nssl0034")),
    (title: "Екатеренбург", image: UIImage(named: "nssl0041")),
    (title: "Сочи", image: UIImage(named: "nssl0042"))]
    
    //private let cityes = ["Москва", "Казань", "Питер", "Екатеренбург", "Сочи"]
    var cityDelegate: AddCityProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MyCitiesTableViewCell", bundle: nil), forCellReuseIdentifier: MyCitiesTableViewCell.reuseid)
    }

}

extension AllCityesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MyCitiesTableViewCell.reuseid, for: indexPath) as! MyCitiesTableViewCell
        
        let array = cityes[indexPath.row]
        print("\(array.title)")
        cell.configure(city: array.title, image: array.image )
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectCity = cityes[indexPath.row]
        self.cityDelegate?.addCity(city: selectCity.title)
        navigationController?.popViewController(animated: true)
    }

}
