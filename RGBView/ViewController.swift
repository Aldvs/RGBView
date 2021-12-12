//
//  ViewController.swift
//  RGBView
//
//  Created by admin on 10.12.2021.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var redTextLabel: UILabel!
    @IBOutlet weak var greenTextLabel: UILabel!
    @IBOutlet weak var blueTextLabel: UILabel!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var colourView: UIView!
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextLabel.text = "Red:"
        redTextLabel.textColor = .red
        greenTextLabel.text = "Green:"
        greenTextLabel.textColor = .green
        blueTextLabel.text = "Blue:"
        blueTextLabel.textColor = .blue
        
        redSlider.value = 0
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        redSlider.minimumTrackTintColor = .red
        
        greenSlider.value = 0
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        greenSlider.minimumTrackTintColor = .green
        
        blueSlider.value = 0
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        blueSlider.minimumTrackTintColor = .blue
        
        redValueLabel.text = String(redSlider.value)
        greenValueLabel.text = String(greenSlider.value)
        blueValueLabel.text = String(blueSlider.value)
    }
    
    //MARK: - IB Actions
    
    @IBAction func sliderAction() {
        redValueLabel.text = String(round(1000 * redSlider.value) / 1000)
        greenValueLabel.text = String(round(1000 * greenSlider.value) / 1000)
        blueValueLabel.text = String(round(1000 * blueSlider.value) / 1000)
        
        
        let redSliderValue = CGFloat(redSlider.value)
        let greenSliderValue = CGFloat(greenSlider.value)
        let blueSliderValue = CGFloat(blueSlider.value)
        
        colourView.backgroundColor = UIColor(red: redSliderValue, green: greenSliderValue, blue: blueSliderValue, alpha: 1)
    }
}

