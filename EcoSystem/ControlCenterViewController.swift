//
//  ControlCenterViewController.swift
//  EcoSystem
//
//  Created by Kashish Bhutani on 05/12/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit

class ControlCenterViewController: UIViewController {
    
    @IBOutlet weak var bgView1: UIView!
    @IBOutlet weak var bgView2: UIView!
    @IBOutlet weak var bgView3: UIView!
    @IBOutlet weak var bgView4: UIView!
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button4: UIButton!
    
    let bulbOffImage = UIImage(named: "bulb_off")
    let bulbOnImage = UIImage(named: "bulb_light")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        
        [bgView1, bgView2, bgView3, bgView4].forEach {$0?.layer.cornerRadius = 8}
        [button1, button2, button3, button4].forEach {$0?.setImage(bulbOffImage, for: .normal)}
    }
    
    @IBAction func didTapButton1(sender: UIButton?) {
        animateAndSetImage(button: button1)
    }
    
    @IBAction func didTapButton2(sender: UIButton?) {
        animateAndSetImage(button: button2)
    }
    
    @IBAction func didTapButton3(sender: UIButton?) {
        animateAndSetImage(button: button3)
    }
    
    @IBAction func didTapButton4(sender: UIButton?) {
        animateAndSetImage(button: button4)
    }
    
    func animateAndSetImage(button: UIButton) {
        if button.image(for: .normal) == bulbOffImage {
            UIView.animate(withDuration: 0.2) {
                button.setImage(self.bulbOnImage, for: .normal)
            }
        } else {
            UIView.animate(withDuration: 0.2) {
                button.setImage(self.bulbOffImage, for: .normal)
            }
        }
    }
}
