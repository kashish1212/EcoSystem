//
//  MainTabBarController.swift
//  EcoSystem
//
//  Created by Kashish Bhutani on 05/12/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    
    let udk = "walkthrough"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        checkForWalkthrough()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        tabBarController?.selectedIndex = 1
    }
    
    func checkForWalkthrough() {
        let defaults = UserDefaults.standard
        if defaults.bool(forKey: udk) == false {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "walkthroughVC1") else {
                return
            }
            let navVC = UINavigationController(rootViewController: vc)
            present(navVC, animated: true, completion: nil)
            defaults.set(true, forKey: udk)
        }
    }
}
