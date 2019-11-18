//
//  MyCitiesViewController.swift
//  Project-Weather
//
//  Created by admin on 30.10.2019.
//  Copyright © 2019 admin. All rights reserved.
//

import UIKit


class MyCitiesViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private let id = "MyCitiesTableViewCell"    
    private var cities = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "addCity" {
            guard let destination = segue.destination as? AllCityesViewController  else {return}
            destination.cityDelegate = self
        }
    }
    
}

extension MyCitiesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: id, for: indexPath) as! MyCitiesTableViewCell
        
        let arrayCity = cities[indexPath.row]
        cell.cityNameLabel.text = arrayCity
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "weatherId", sender: self)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            cities.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}

extension MyCitiesViewController: AddCityProtocol {
    
    func addCity(city: String) {
    
        if !cities.contains(city) {
            cities.append(city)
            tableView.reloadData()
        }
    }
    
}
