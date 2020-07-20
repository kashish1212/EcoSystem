//
//  RecoveryFormViewController.swift
//  EcoSystem
//
//  Created by Bhagat Singh on 05/12/19.
//  Copyright © 2019 Kashish Bhutani. All rights reserved.
//

import UIKit
import WebKit

class RecoveryFormViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        let url = URL(string: "https://kashishbhutsni.typeform.com/to/ZZu7ar")
        guard let unwrappedURL = url else {
            return
        }
        let urlRequest = URLRequest(url: unwrappedURL)
        webView.load(urlRequest)
    }
}
