//
//  ViewController.swift
//  DZCountryPickerApp
//
//  Created by Danial Zahid on 20/06/2019.
//  Copyright © 2019 Danial Zahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CountryPickerDelegate {

    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var countryNameLabel: UILabel!
    @IBOutlet weak var flagEmojiLabel: UILabel!
    @IBOutlet weak var phoneCodeLabel: UILabel!
    
    let countryPicker = CountryPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPicker.textField = countryField
        countryPicker.delegate = self
    }
    
    func didSelectCountry(country: Country) {
        countryNameLabel.text = country.name
        flagEmojiLabel.text = country.flagEmoji
        phoneCodeLabel.text = country.phoneCode
    }
}

