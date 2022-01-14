//
//  StartViewController.swift
//  RGBView
//
//  Created by admin on 23.12.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    
    func getNewColor(_ color: UIColor!)
}

class MainViewController: UIViewController {

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let colorVC = segue.destination as? ColorViewController else { return }
        colorVC.startViewColor = view.backgroundColor
        colorVC.delegate = self
    }
}

extension MainViewController: ColorViewControllerDelegate {
    
    func getNewColor(_ color: UIColor!) {
        view.backgroundColor = color
    }
}
