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
    private let cityes = ["Москва", "Казань", "Питер", "Екатеренбург", "Сочи"]
    var cityDelegate: AddCityProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }

}

extension AllCityesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! AllCityesTableViewCell
        
        let array = cityes[indexPath.row]
        cell.cityNameLabel.text = array
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectCity = cityes[indexPath.row]
        self.cityDelegate?.addCity(city: selectCity)
        navigationController?.popViewController(animated: true)
    }

}
