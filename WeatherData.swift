//
//  WeatherData.swift
//  WeatherApp
//
//  Created by Даниил Петров on 04.02.2023.
//

import Foundation

struct WeatherData: Codable {
    
    let name: String?
    let main: Main
    let weather: [Weather]
}

struct Coord: Codable {
    let lon: Double
    let lat: Double
}

struct Weather: Codable {
    let id: Int
}

struct Main: Codable {
    let temp: Double
}
