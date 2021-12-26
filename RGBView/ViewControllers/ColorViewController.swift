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
    
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorView.layer.cornerRadius = 15
        
        colorView.backgroundColor = startViewColor
        
        tempColor = CIColor(color: startViewColor)
        
        redLabel.text = String(format: "%.2f", tempColor.red)
        greenLabel.text = String(format: "%.2f", tempColor.green)
        blueLabel.text = String(format: "%.2f", tempColor.blue)
        
        redSlider.value = Float(round((1000 * tempColor.red) / 1000))
        greenSlider.value = Float(round((1000 * tempColor.green) / 1000))
        blueSlider.value = Float(round((1000 * tempColor.blue) / 1000))
        
        redTextField.text = String(format: "%.2f", tempColor.red)
        greenTextField.text = String(format: "%.2f", tempColor.green)
        blueTextField.text = String(format: "%.2f", tempColor.blue)
        
    }
    
    //MARK: - IB Actions
    
    @IBAction func sliderAction() {
//        colorView.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
    @IBAction func doneButton(_ sender: Any) {
    }
    
}

