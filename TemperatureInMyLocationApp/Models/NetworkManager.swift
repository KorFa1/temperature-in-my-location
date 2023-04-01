//
//  NetworkManager.swift
//  TemperatureInMyLocationApp
//
//  Created by Кирилл Софрин on 14.03.2023.
//

import Foundation

protocol NetworkManagerDelegate: AnyObject {
    func currect(temperature: Int)
}


class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let keyAPI = "45a27235-6770-43ea-8851-7d5ba0f4a21b"
    
    weak var delegate: NetworkManagerDelegate?
    
    private init() { }
    
    func fetchWeather(lat: Double, lon: Double) {
        let urlString = "https://api.weather.yandex.ru/v2/forecast?lat=\(lat)&lon=\(lon)"
        guard let url = URL(string: urlString) else { return }

        var request = URLRequest(url: url)
        request.addValue(keyAPI, forHTTPHeaderField: "X-Yandex-API-Key")

        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else { return }
            if let weatherData = try? JSONDecoder().decode(Weather.self, from: data) {
                self.delegate?.currect(temperature: weatherData.fact.temp)
            } else {
                print("Error")
            }
        }
        task.resume()
    }
}
