//
//  WeatherService.swift
//  Project-Weather
//
//  Created by admin on 11.06.2020.
//  Copyright © 2020 admin. All rights reserved.
//

import Foundation
import Alamofire


class WeatherService {
    
    let baseUrl = "http://api.openweathermap.org"
    let apiKey = "92cabe9523da26194b02974bfcd50b7e"
    
    func loadWeatherData(city: String) {
        
        let path = "/data/2.5/forecast"
        let parameters: Parameters = [
            "q": city,
            "units": "metric",
            "appid": apiKey
        ]
        
        let url = baseUrl + path

        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { repsonse in
            print(repsonse.value)
        }
    }    
}
