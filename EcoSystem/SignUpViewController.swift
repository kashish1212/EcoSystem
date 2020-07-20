//
//  SignUpViewController.swift
//  EcoSystem
//
//  Created by Kashish Bhutani on 12/6/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {
    @IBOutlet weak var enterText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var repassText: UITextField!
    @IBOutlet weak var signUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGradient()
        setupViews()
        

        // Do any additional setup after loading the view.
    }
    func setupViews() {
           signUp.layer.cornerRadius = 8
           signUp.layer.borderColor = UIColor.white.cgColor
           signUp.layer.borderWidth = 1.0
           signUp.setTitleColor(UIColor.white, for: .normal)
       }

    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if enterText.text != "" && passText.text != "" {
            
         if passText.text == repassText.text{
        
            Auth.auth().createUser(withEmail: enterText.text!, password: passText.text!) { (authdata, error) in
                
                if error != nil {
                    self.makealert(titleInput: "Error" , messageInput: error?.localizedDescription ?? "Error")
                    
                } else {
                    
                    self.performSegue(withIdentifier: "toSignIn", sender: nil)
                    
                }
            }
            }else {
                makealert(titleInput: "Error", messageInput: "Passwords Do Not Match")
            }
        } else{
            makealert(titleInput: "Error", messageInput: "Enter valid Id and Password")
            
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
    func makealert(titleInput:String, messageInput:String)
    {
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
        
    }
    

}
