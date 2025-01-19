//
//  WeatherModel.swift
//  SimpleWeatherApp
//
//  Created by Faryk on 19.01.2025.
//

import Foundation

struct WeatherData: Codable {
    let main: Main
    let weather: [Weather]
    let wind: Wind
    let name: String
}

struct Main: Codable {
    let temp: Double
    let humidity: Int
}

struct Weather: Codable {
    let description: String
}

struct Wind: Codable {
    let speed: Double
}

//WeatherData: Represents the main weather data structure.
//Main: Represents the main weather information like temperature and humidity
//Weather: Represents weather description ("clear sky")
//Wind: Represents wind speed
