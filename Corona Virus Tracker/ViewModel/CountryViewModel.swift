//
//  CountryViewModel.swift
//  Corona Virus Tracker
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

class CountryViewModel {
    
    // define some variables
    fileprivate let service = CountryDataService()
    var countryItems = [Country]()
    
    // define some functions
    func getCountryState(completion: @escaping (ViewModelState) -> Void) {
        service.getCountryState { (country, err) in
            if let error = err {
                print(error.localizedDescription)
                completion(.failure)
                return
            }
            for countries in country! {
                self.countryItems.append(countries)
            }
            completion(.success)
        }
    }
    
}
