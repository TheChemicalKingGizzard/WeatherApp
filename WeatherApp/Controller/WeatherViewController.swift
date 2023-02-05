//
//  ViewController.swift
//  WeatherApp
//
//  Created by Даниил Петров on 03.02.2023.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var degreesValue: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var weatherState: UIImageView!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
    }

    @IBAction func searchPressed(_ sender: UIButton) {
        currentLocation.text = searchTextField.text
        searchTextField.endEditing(true)
    }
    
    //Действия, выполняемые по нажатию returnButton в клавиатуре
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        currentLocation.text = searchTextField.text
        searchTextField.endEditing(true)
        
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let city = searchTextField.text{
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }
}

