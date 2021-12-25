//
//  StartViewController.swift
//  RGBView
//
//  Created by admin on 23.12.2021.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let colorVC = segue.destination as? ColorViewController else { return }
        colorVC.startView = view.backgroundColor
    }
    
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
    }


}
