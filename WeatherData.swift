//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Даниил Петров on 04.02.2023.
//

import Foundation

struct WeatherData: Decodable {
    
    let name: String?
    let main: Main
    let weather: [Weather]
}

struct Coord: Decodable {
    let lon: Double
    let lat: Double
}

struct Weather: Decodable {
    let id: Int
}

struct Main: Decodable {
    let temp: Double
}
