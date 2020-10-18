//
//  AboutViewController.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    //MARK: - @IBOutlets
    
    
    //MARK: - Variables
    
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(rgb: 0x151515)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.title = "About me"
        tabBarController?.navigationItem.rightBarButtonItem = nil
    }
    
    //MARK: - Functions

}
