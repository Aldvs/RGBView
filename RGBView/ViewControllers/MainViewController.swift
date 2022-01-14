//
//  StartViewController.swift
//  RGBView
//
//  Created by admin on 23.12.2021.
//

import UIKit

protocol ColorViewControllerDelegate {
    func setColor(_ color: UIColor!)
}

class MainViewController: UIViewController {

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let colorVC = segue.destination as? ColorViewController else { return }
        colorVC.delegate = self
        colorVC.viewColor = view.backgroundColor
        }
}

extension MainViewController: ColorViewControllerDelegate {
    
    func setColor(_ color: UIColor!) {
        view.backgroundColor = color
    }
}
