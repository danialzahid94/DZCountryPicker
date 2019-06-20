//
//  ViewController.swift
//  DZCountryPickerApp
//
//  Created by Danial Zahid on 20/06/2019.
//  Copyright © 2019 Danial Zahid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countryField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    
    let countryPicker = CountryPicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryPicker.textField = countryField
    }


}

