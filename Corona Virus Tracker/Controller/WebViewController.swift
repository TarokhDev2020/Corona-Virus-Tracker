//
//  WebViewController.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/16/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController {

    //MARK: - @IBOutlets
    var url: String?
    
    
    //MARK: - Variables
    @IBOutlet var webView: WKWebView!
    
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()

        self.webView.load(URLRequest(url: URL(string: url!)!))
    }
    
    //MARK: - Functions
    

}
