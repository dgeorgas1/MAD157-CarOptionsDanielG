//
//  ViewController.swift
//  CarOptions
//
//  Created by student on 2/7/24.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var selectedColor = "Blue"
    var selectedTire = ""
    var selectedTrim = ""

    let colorOptionsArray = ["Blue", "Green", "Orange", "Red"]
    
    let tireOptionsArray = ["", "Black", "Black Diamond", "Silver"]
    
    let trimOptionsArray = ["", "Black", "Blue", "Gray"]

    // Picker Views
    @IBOutlet weak var color_picker: UIPickerView!
    @IBOutlet weak var tire_picker: UIPickerView!
    @IBOutlet weak var trim_picker: UIPickerView!
    
    // Image View
    @IBOutlet weak var ImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        color_picker.dataSource = self
        color_picker.delegate = self
        
        tire_picker.dataSource = self
        tire_picker.delegate = self
        
        trim_picker.dataSource = self
        trim_picker.delegate = self

        updateImageView(selectedColor, selectedTire, selectedTrim)
    }

    //UIPickerViewDataSource
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == color_picker {
            return colorOptionsArray.count
        }
        else if pickerView == tire_picker {
            return tireOptionsArray.count
        }
        else if pickerView == trim_picker {
            return trimOptionsArray.count
        }
        return 0
    }

    //UIPickerViewDelegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == color_picker {
            return colorOptionsArray[row]
        }
        else if pickerView == tire_picker {
            return tireOptionsArray[row]
        }
        else if pickerView == trim_picker {
            return trimOptionsArray[row]
        }
        return nil
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == color_picker {
            selectedColor = colorOptionsArray[row]
        }
        else if pickerView == tire_picker {
            selectedTire = tireOptionsArray[row]
        }
        else if pickerView == trim_picker {
            selectedTrim = trimOptionsArray[row]
        }
        updateImageView(selectedColor, selectedTire, selectedTrim)
    }

    func updateImageView(_ color: String, _ tire: String, _ trim: String) {
        var image: String
        if tire == "" && trim == "" {
            image = color
        }
        else if trim == "" {
            image = "\(color) - \(tire)"
        }
        else if tire == "" {
            if color == "Green" && trim == "Blue" {
                image = "GreenBlueTrim"
            }
            else {
                image = "\(color) - \(trim) Trim"
            }
        }
        else if color != "" && tire != "" && trim != "" {
            image = "TiresTrim"
        }
        else {
            image = ""
        }
        print(image)
        ImageView.image = UIImage(named: image)
    }
}
