//
//  WeatherService.swift
//  Project-Weather
//
//  Created by admin on 11.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire
import UIKit
import RealmSwift


class WeatherService {
    
    private let baseUrl = "http://api.openweathermap.org"
    private let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    func saveWeatherData(_ weathers: [Weather]) {
        do {
            let realm = try Realm()
            realm.beginWrite()
            realm.add(weathers)
            try realm.commitWrite()
        } catch  {
            print(error)
        }
    }
    
    func loadWeatherData(city: String, completion: @escaping ([Weather]) -> Void ) {
        
        let path = "/data/2.5/forecast"
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        
        let url = baseUrl + path

        Alamofire.request(url, method: .get, parameters: parameters).responseData { repsonse in
            guard let data = repsonse.value else { return }
            let weather = try! JSONDecoder().decode(WeatherResponse.self, from: data).list
            self.saveWeatherData(weather)
            completion(weather)
        }
    }    
}
