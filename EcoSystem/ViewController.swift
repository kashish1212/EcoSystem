//
//  ViewController.swift
//  EcoSystem
//
//  Created by Kashish Bhutani on 12/3/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addGradient()
        setupViews()
    }
    
    func setupViews() {
        signInButton.layer.cornerRadius = 8
        signInButton.layer.borderColor = UIColor.white.cgColor
        signInButton.layer.borderWidth = 1.0
        signInButton.setTitleColor(UIColor.white, for: .normal)
    }

    @IBAction func goButtonClicked(_ sender: Any) {
        
        if emailText.text != "" && passText.text != ""{
            
            Auth.auth().signIn(withEmail: emailText.text!, password: passText.text!) { (authdata, error) in
                if error != nil {
                    self.makealert2(titleInput: "Error", messageInput: error?.localizedDescription ?? "Error")
                    
                }else {
                    self.performSegue(withIdentifier: "toDashboardVC", sender: nil)
                }
            }
            
        }
        else {
            makealert2(titleInput: "Error", messageInput: "Enter valid Id and Password")
        }
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
    
    func makealert2(titleInput:String, messageInput:String)
    {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
}

