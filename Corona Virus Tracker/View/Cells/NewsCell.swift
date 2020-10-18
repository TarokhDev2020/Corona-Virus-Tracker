//
//  NewsCell.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/14/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {
    
    //MARK: - @IBOutlets
    @IBOutlet var newsTitleLabel: UILabel!
    @IBOutlet var newsDescriptionLabel: UILabel!
    
    
    //MARK: - Variables
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
