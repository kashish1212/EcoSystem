//
//  MainDashboardViewController.swift
//  EcoSystem
//
//  Created by Kashish Bhutani on 05/12/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit

class MainDashboardViewController: UIViewController {
    
    @IBOutlet weak var poeLedButton: UIButton!
    @IBOutlet weak var solarButton: UIButton!
    @IBOutlet weak var costRecovery: UIButton!
    @IBOutlet weak var elecrticReduction: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        addGradient()
    }
    
    func setupViews() {
        [poeLedButton, solarButton, costRecovery, elecrticReduction].forEach {
            $0?.layer.cornerRadius = 8
            $0?.clipsToBounds = true
        }
        navigationController?.title = "Eco-System"
    }
    
    func addGradient() {
        let layer = CAGradientLayer()
        layer.colors = [
            UIColor.init(red: 40/255, green: 60/255, blue: 134/255, alpha: 1.0).cgColor,
            UIColor.init(red: 69/255, green: 162/255, blue: 71/255, alpha: 1.0).cgColor,
        ]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.frame = self.view.bounds
        view.layer.insertSublayer(layer, at: 0)
    }
}
