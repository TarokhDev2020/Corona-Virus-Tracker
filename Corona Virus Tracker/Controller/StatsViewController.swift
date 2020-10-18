//
//  ViewController.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit
import JGProgressHUD

class StatsViewController: UIViewController {

    //MARK: - @IBOutlets
    @IBOutlet var countryTableView: UITableView!
    
    
    //MARK: - Variables
    private let countryViewModel = CountryViewModel()
    var hud: JGProgressHUD?
    
    
    //MARK: - Views
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgb: 0x151515)
        countryTableView.register(UINib(nibName: "StateCell", bundle: nil), forCellReuseIdentifier: "stateCell")
        countryTableView.delegate = self
        countryTableView.dataSource = self
        countryTableView.separatorColor = .white
        countryTableView.backgroundColor = .black
        countryTableView.isHidden = true
        hud = JGProgressHUD(style: .dark)
        hud?.indicatorView = JGProgressHUDIndeterminateIndicatorView()
        hud?.show(in: view, animated: true)
        getCountryState()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.title = "Corona Virus Tracker"
        tabBarController?.navigationItem.rightBarButtonItem = nil
    }

    //MARK: - Functions
    private func getCountryState() {
        countryViewModel.getCountryState { (state) in
            switch state {
            case .success:
                DispatchQueue.main.async {
                    self.hud?.dismiss(animated: true)
                    self.countryTableView.isHidden = false
                    self.countryTableView.reloadData()
                }
            case .failure:
                print("Failure")
            }
        }
    }

}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension StatsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countryViewModel.countryItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let countryCell = tableView.dequeueReusableCell(withIdentifier: "stateCell") as! StateCell
        countryCell.contentView.backgroundColor = .black
        let country = countryViewModel.countryItems[indexPath.row]
        countryCell.configureCell(country: country)
        return countryCell
    }
    
}

