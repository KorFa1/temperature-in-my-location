//
//  ViewController.swift
//  TemperatureInMyLocationApp
//
//  Created by Кирилл Софрин on 14.03.2023.
//

import UIKit
import CoreLocation

class MainViewController: UIViewController {

    let button = UIButton()
    let label = UILabel()
    let temperatureLabel = UILabel()
    
    var temperatureLabelText = ""

    private let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        view.backgroundColor = .gray
        
        locationManager.delegate = self
        NetworkManager.shared.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
    }
    
    override func viewWillLayoutSubviews() {
        setLabel()
        setButton()
        setTemperatureLabel()
    }
    
    
    // MARK: - Objc methods
    @objc func buttonPressed() {
        locationManager.startUpdatingLocation()
    }
}


// MARK: - CLLocationManagerDelegate
extension MainViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        if location.horizontalAccuracy <= 1000 {
            locationManager.stopUpdatingLocation()
            NetworkManager.shared.fetchWeather(lat: location.coordinate.latitude, lon: location.coordinate.longitude)
        }
    }
}


// MARK: - NetworkManagerDelegate
extension MainViewController: NetworkManagerDelegate {
    
    func currect(temperature: Int) {
        DispatchQueue.main.async {
            self.temperatureLabelText = String(temperature) + " °C"
            self.temperatureLabel.text = self.temperatureLabelText
        }
    }
}
