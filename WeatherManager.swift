//
//  Weather.swift
//  WeatherApp
//
//  Created by Даниил Петров on 04.02.2023.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=9d38587542071c01bc0c658cef84e207&units=metric&q=london"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
    }
    
    func performRequest(urlString: String) {
        
        guard let url = URL(string: urlString) else { return }
        
        let session = URLSession(configuration: .default)
        
        let task = session.dataTask(with: url) { (data, response,error) in
            
            
            if error != nil {
                print(error!)
                return
            }
            if let safeData = data  {
                self.parseJSON(weatherData: safeData)
            }
        }
        task.resume()
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        
        do {
            let decodedData = try decoder.decode(WeatherData.self,
                                                 from: weatherData)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let name = decodedData.name
            
            let weather = WeatherModel(conditionID: id,
                                       cityName: name,
                                       temperature: temp)
            
            print(weather.temperaturestring)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
