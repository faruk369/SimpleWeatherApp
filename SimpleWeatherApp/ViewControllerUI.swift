//
//  ViewControllerUI.swift
//  SimpleWeatherApp
//
//  Created by Faryk on 19.01.2025.
//

import UIKit

extension ViewController {
    // MARK: - UI Setup

    func setupUI() {
        // Set up the background color
        view.backgroundColor = .lightGray
        
        // Add labels and button as subviews
        setupLocationIcon()
        setupCityLabel()
        setupWeatherIcon()
        setupTemperatureLabel()
        setupHumidityLabel()
        setupWindSpeedLabel()
        setupRefreshButton()
        
        // Set up Auto Layout constraints
        setupConstraints()
    }
    
    // Location Icon Setup
       private func setupLocationIcon() {
           locationIcon.image = UIImage(systemName: "location.fill")  // Use system location icon
           locationIcon.translatesAutoresizingMaskIntoConstraints = false
           locationIcon.tintColor = .black
           view.addSubview(locationIcon)
       }
    
    // City Label Setup
    private func setupCityLabel() {
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont.boldSystemFont(ofSize: 24)
        cityLabel.textColor = .black
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityLabel)
    }

    private func setupWeatherIcon() {
            weatherIcon.translatesAutoresizingMaskIntoConstraints = false
            weatherIcon.tintColor = .black
            view.addSubview(weatherIcon)
        }
    
    // Temperature Label Setup
    private func setupTemperatureLabel() {
        temperatureLabel.textAlignment = .center
        temperatureLabel.font = UIFont.boldSystemFont(ofSize: 50)
        temperatureLabel.textColor = .black
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(temperatureLabel)
    }

    // Humidity Label Setup
    private func setupHumidityLabel() {
        humidityLabel.textAlignment = .center
        humidityLabel.font = UIFont.systemFont(ofSize: 18)
        humidityLabel.textColor = .gray
        humidityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(humidityLabel)
    }

    // Wind Speed Label Setup
    private func setupWindSpeedLabel() {
        windSpeedLabel.textAlignment = .center
        windSpeedLabel.font = UIFont.systemFont(ofSize: 18)
        windSpeedLabel.textColor = .gray
        windSpeedLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(windSpeedLabel)
    }

    // Refresh Button Setup
    private func setupRefreshButton() {
        refreshButton.setTitle("Refresh", for: .normal)
        refreshButton.backgroundColor = .systemBlue
        refreshButton.setTitleColor(.white, for: .normal)
        refreshButton.layer.cornerRadius = 10
        refreshButton.translatesAutoresizingMaskIntoConstraints = false
        
        //using closures instead of objc-Selectors:
        
        refreshButton.addAction(UIAction { [weak self] _ in
             // Unwrap refreshButton and call refreshWeather
             if let button = self?.refreshButton {
                 self?.refreshWeather(button)  // Pass the actual refreshButton (unwrapped)
             }
         }, for: .touchUpInside)  //using closures instead of objc-Selectors
        
        view.addSubview(refreshButton)
    }

    // Auto Layout Constraints Setup
    private func setupConstraints() {
        // Location Icon Constraints
        NSLayoutConstraint.activate([
            locationIcon.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            locationIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            locationIcon.widthAnchor.constraint(equalToConstant: 40),
            locationIcon.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // City Label Constraints
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: locationIcon.bottomAnchor, constant: 10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cityLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        // Weather Icon Constraints
        NSLayoutConstraint.activate([
            weatherIcon.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 100),
            weatherIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherIcon.widthAnchor.constraint(equalToConstant: 100),
            weatherIcon.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Temperature Label Constraints
        NSLayoutConstraint.activate([
            temperatureLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 100),
            temperatureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            temperatureLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        // Humidity Label Constraints
        NSLayoutConstraint.activate([
            humidityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            humidityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            humidityLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        // Wind Speed Label Constraints
        NSLayoutConstraint.activate([
            windSpeedLabel.topAnchor.constraint(equalTo: humidityLabel.bottomAnchor, constant: 5), // Less space
            windSpeedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            windSpeedLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        
        // Refresh Button Constraints
        NSLayoutConstraint.activate([
            refreshButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            refreshButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            refreshButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6),
            refreshButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
}

