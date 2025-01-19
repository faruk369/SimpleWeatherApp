//
//  WeatherService.swift
//  SimpleWeatherApp
//
//  Created by Faryk on 19.01.2025.
//
import Foundation

class WeatherService {
    
    let apiKey = "8bf1a8789fcbd78ee7d56def84ab7adb"
    
    func fetchWeather(forCity city: String, completion: @escaping (WeatherData?, Error?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)&units=metric"
        
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil, error)
                return
            }
            
            guard let data = data else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No data received"]))
                return
            }
            
            do {
                let weatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                completion(weatherData, nil)
            } catch {
                completion(nil, error)
            }
        }.resume()
    }
}

//handling the networking request
// FetchWeather func makes an HTTP request to the OpenWeatherMap API, fetches the weather data, and decodes it into my WeatherData model
