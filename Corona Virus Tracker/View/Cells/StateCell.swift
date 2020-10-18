//
//  StateCell.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/16/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit
import Kingfisher

class StateCell: UITableViewCell {
    
    //MARK: - @IBOutlets
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var countryImageView: UIImageView!
    @IBOutlet var caseLabel: UILabel!
    @IBOutlet var deathLabel: UILabel!
    @IBOutlet var recoveredLabel: UILabel!
    @IBOutlet var activeLabel: UILabel!
    @IBOutlet var stateView: UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(country: Country) {
        let url = URL(string: (country.countryInfo?.flag)!)
        countryImageView.layer.cornerRadius = 3.0
        countryImageView.layer.masksToBounds = true
        countryImageView.kf.setImage(with: url)
        caseLabel.text = "CASES: \(formattedNumber(country.cases!))"
        deathLabel.text = "DEATHS: \(formattedNumber(country.deaths!))"
        recoveredLabel.text = "RECOVERED: \(formattedNumber(country.recovered!))"
        activeLabel.text = "ACTIVE: \(formattedNumber(country.active!))"
        countryLabel.text = country.country
    }
    
    private func formattedNumber(_ covid: Int) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.groupingSeparator = ","
        numberFormatter.groupingSize = 3
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.numberStyle = .decimal
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter.string(from: covid as NSNumber)!
    }

}
