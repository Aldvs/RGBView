//
//  ViewController.swift
//  RGBView
//
//  Created by admin on 10.12.2021.
//

import UIKit

class ColorViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    

    var startViewColor: UIColor!
    var tempColor: CIColor!
    
    var delegate: ColorViewControllerDelegate!
    
    //почему то так и не понял почему при повторном заходе в настройки слайдер вэлью некоректно отображается по цвету главной вью
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        colorView.backgroundColor = startViewColor
        
        tempColor = CIColor(color: startViewColor)
        
        redLabel.text = string(from: tempColor.red)
        greenLabel.text = string(from: tempColor.green)
        blueLabel.text = string(from: tempColor.blue)
        
        redSlider.value = roundFloat(from: tempColor.red)
        greenSlider.value = roundFloat(from: tempColor.green)
        blueSlider.value = roundFloat(from: tempColor.blue)
        
        redTextField.text = string(from: tempColor.red)
        greenTextField.text = string(from: tempColor.green)
        blueTextField.text = string(from: tempColor.blue)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
        
        
        
    }
    
    //MARK: - IB Actions
    @IBAction func rgbSlider(_ sender: UISlider) {
    
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value), alpha: 1)
        
        switch sender {
        case redSlider:
            setValue(for: redLabel)
            setValueTextField(for: redTextField)
        case greenSlider:
            setValue(for: greenLabel)
            setValueTextField(for: greenTextField)
        default:
            setValue(for: blueLabel)
            setValueTextField(for: blueTextField)
        }
    }
    
    @IBAction func doneButton(_ sender: Any) {
        view.endEditing(true)
        delegate.getNewColor(colorView.backgroundColor)
        dismiss(animated: true)
    }
    
    private func string(from color: CGFloat) -> String {
        
        String(format: "%.2f", color)
    }
    
    private func roundFloat(from color: CGFloat) -> Float {
        
        Float(round((1000 * color) / 1000))
    }
    
    private func setValue(for labels: UILabel...) {
        
        labels.forEach { label in
            switch label {
            case redLabel: label.text = string(from: CGFloat(redSlider.value))
            case greenLabel: label.text = string(from: CGFloat(greenSlider.value))
            default: label.text = string(from: CGFloat(blueSlider.value))
            }
        }
    }
    
    private func setValueTextField(for textFields: UITextField...) {
        
        textFields.forEach { textField in
            switch textField {
            case redTextField: textField.text = string(from: CGFloat(redSlider.value))
            case greenTextField: textField.text = string(from: CGFloat(greenSlider.value))
            default: textField.text = string(from: CGFloat(blueSlider.value))
            }
        }
    }
    
}

extension ColorViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let newValue = textField.text else { return }
        
        guard let inputUserText = textField.text, !inputUserText.isEmpty else {
            showAlert(title: "Empty login field", message: "Please, enter your login")
            return
        }
        guard let _ = Float(newValue) else {
            showAlert(title: "Invalid syntax", message: "Try again")
            return
        }
        
        switch textField {
        case redTextField:
            redLabel.text = newValue
            redSlider.value = Float(newValue) ?? 0.0
        case greenTextField:
            greenLabel.text = newValue
            greenSlider.value = Float(newValue) ?? 0.0
        default:
            blueLabel.text = newValue
            blueSlider.value = Float(newValue) ?? 0.0
        }
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                            green: CGFloat(greenSlider.value),
                                            blue: CGFloat(blueSlider.value), alpha: 1)
        
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}
