//
//  Weather.swift
//  TemperatureInMyLocationApp
//
//  Created by Кирилл Софрин on 14.03.2023.
//

import Foundation

// MARK: - Weather
struct Weather: Codable {
    let fact: Fact
}

// MARK: - Fact
struct Fact: Codable {
    let temp: Int
}
