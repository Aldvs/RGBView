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
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    

    var startView: UIColor!
    
    
    //MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 15
        colorView.backgroundColor = startView
    }
    
    //MARK: - IB Actions
    
    @IBAction func sliderAction() {
//        colorView.backgroundColor = UIColor(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
    }
    @IBAction func doneButton(_ sender: Any) {
    }
    
}

