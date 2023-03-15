//
//  MainView.swift
//  TemperatureInMyLocationApp
//
//  Created by Кирилл Софрин on 14.03.2023.
//

import UIKit
import SnapKit

extension MainViewController {
    
    func setLabel() {
        label.text = """
                    Press the button to
                    get the temperature
                    """
        label.numberOfLines = 0
        label.font = UIFont.monospacedSystemFont(ofSize: 25, weight: .bold)
        label.textColor = .white
        label.textAlignment = .center
        label.sizeToFit()
        view.addSubview(label)
        
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(80)
        }
    }
    
    func setButton() {
        button.setTitle("Press me", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.monospacedSystemFont(ofSize: 25, weight: .bold)
        button.backgroundColor = .black
        button.layer.cornerRadius = 20
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().offset(-60)
            make.width.equalToSuperview().dividedBy(1.5)
            make.height.equalTo(60)
        }
    }
    
    func setTemperatureLabel() {
        temperatureLabel.text = temperatureLabelText
        temperatureLabel.numberOfLines = 0
        temperatureLabel.font = UIFont.systemFont(ofSize: 90, weight: .bold)
        temperatureLabel.textColor = .white
        temperatureLabel.textAlignment = .center
        temperatureLabel.sizeToFit()
        view.addSubview(temperatureLabel)
        
        temperatureLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
