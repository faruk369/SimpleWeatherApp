//
//  ViewController.swift
//  SimpleWeatherApp
//
//  Created by Faryk on 19.01.2025.
//

import UIKit

class ViewController: UIViewController {
    
    var cities = ["London", "New York", "Tokyo", "Paris", "Sydney", "Berlin"]
    
    // MARK: - Properties
    let locationIcon = UIImageView()
    let cityLabel = UILabel()
    let weatherIcon = UIImageView()
    let temperatureLabel = UILabel()
    let humidityLabel = UILabel()
    let windSpeedLabel = UILabel()
    let refreshButton = UIButton()
    
    let weatherService = WeatherService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the UI programmatically
        setupUI()
        
        // Fetch weather data for the default city on load
        fetchWeather(forCity: cities.randomElement()!)
    }
    
   func refreshWeather(_ sender: UIButton) {
       let randomCity = cities.randomElement() ?? "London"  // Default to London
           fetchWeather(forCity: randomCity)
    }
    
    func fetchWeather(forCity city: String) {
        weatherService.fetchWeather(forCity: city) { [weak self] weatherData, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.showError(error)
                }
                return
            }
            
            if let weatherData = weatherData {
                DispatchQueue.main.async {
                    self?.updateUI(with: weatherData)
                }
            }
        }
    }
    
    func setWeatherIcon(for temperature: Double) {
            switch temperature {
            case ..<0:
                weatherIcon.image = UIImage(systemName: "snowflake")  // Sun icon
            case 5..<10:
                weatherIcon.image = UIImage(systemName: "cloud.fill")  // Cloud icon
            case 15..<30:
                weatherIcon.image = UIImage(systemName: "sun.max.fill")   // Snowflake icon
            default:
                weatherIcon.image = UIImage(systemName: "cloud.fill") // Default to cloud
            }
        }
    
    func updateUI(with weatherData: WeatherData) {
           cityLabel.text = weatherData.name
         let temperatureInt = Int(weatherData.main.temp) // Convert temperature to Int to remove decimal places (Casting to Int) //cos my API can only return a double
        
         temperatureLabel.text = "\(temperatureInt)°C" //Display as an Int
           humidityLabel.text = "Humidity: \(weatherData.main.humidity)%"
           windSpeedLabel.text = "Wind: \(weatherData.wind.speed) m/s"
           
           // Set the appropriate weather icon
        setWeatherIcon(for: Double(temperatureInt))
       }
    
    func showError(_ error: Error) {
        let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}

