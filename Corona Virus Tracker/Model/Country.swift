//
//  Country.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

// MARK: - Country
struct Country: Codable {
    var updated: Int?
    var country: String?
    var countryInfo: CountryInfo?
    var cases, todayCases, deaths, todayDeaths: Int?
    var recovered, todayRecovered, active, critical: Int?
    var casesPerOneMillion: Int?
    var deathsPerOneMillion: Double?
    var tests, testsPerOneMillion, population: Int?
    var oneCasePerPeople, oneDeathPerPeople, oneTestPerPeople: Int?
    var activePerOneMillion, recoveredPerOneMillion, criticalPerOneMillion: Double?
}

// MARK: - CountryInfo
struct CountryInfo: Codable {
    var _id: Int?
    var iso2, iso3: String?
    var lat, long: Double?
    var flag: String?

    enum CodingKeys: String, CodingKey {
        case _id = "_id"
        case iso2, iso3, lat, long, flag
    }
}
