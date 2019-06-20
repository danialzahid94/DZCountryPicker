//
//  CountryPicker.swift
//  CountryPicker
//
//  Created by Danial Zahid on 18/06/2019.
//  Copyright © 2019 Danial Zahid. All rights reserved.
//

import UIKit

protocol CountryPickerDelegate {
    func didSelectCountry(country: Country)
}

class CountryPicker: NSObject {
    
    fileprivate var countries = [Country]()
    fileprivate var delegate: CountryPickerDelegate?
    
    public let pickerView = UIPickerView()
    
    public var font : UIFont = UIFont.systemFont(ofSize: 15.0)
    
    public var textColor : UIColor = .black
    
    public var selectedCountry : Country? {
        didSet {
            guard let country = selectedCountry else { return }
            textField?.text = country.countryFlagAndCode()
            delegate?.didSelectCountry(country: country)
        }
    }
    
    public var textField : UITextField? {
        didSet {
            textField?.inputView = pickerView
            textField?.text = selectedCountry?.countryFlagAndCode()
        }
    }
    
    override init() {
        super.init()
        
        populateCountryList()
        setupPicker()
    }
    
    func setupPicker() {
        
        pickerView.delegate = self
        pickerView.backgroundColor = .white
        
        if let currentRegion = Locale.current.regionCode {
            selectedCountry = Country(isoCode: currentRegion)
        }
    }
    
    private func populateCountryList() {
        let list = Locale.isoRegionCodes.map { isoCode in
            return Country(isoCode: isoCode)
        }
        // Removing Regions that don't have phone codes i.e Antarctica, Aland Islands
        countries = list.filter { $0.phoneCode != ""}
        countries.sort(by: {$0.name < $1.name})
        let empty = Country(isoCode: "")
        countries.insert(empty, at: 0)
    }
    
    func didSelectCountry(country: Country) {
        selectedCountry = country
    }
}

extension CountryPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        didSelectCountry(country: countries[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.textColor = textColor
        label.font = font
        label.text = countries[row].countryFlagAndName()
        return label
    }
}
