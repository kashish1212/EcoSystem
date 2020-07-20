//
//  SettingsViewController.swift
//  EcoSystem
//
//  Created by Kashish Bhutani on 12/3/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imageHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageView: UIImageView!
    var settings = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetY = scrollView.contentOffset.y
        let height = max(140 - contentOffsetY, 60)
        imageHeightConstraint.constant = height
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
