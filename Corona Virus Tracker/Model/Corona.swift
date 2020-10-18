//
//  Corona.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

struct Corona: Codable {
    
    // define some variables
    var todayCases: Int
    var todayDeaths: Int
    var todayRecovered: Int
    var active: Int
    var critical: Int
    var affectedCountries: Int
    
}

