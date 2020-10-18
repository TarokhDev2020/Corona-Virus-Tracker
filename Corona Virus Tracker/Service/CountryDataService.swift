//
//  CountryDataService.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import Moya

class CountryDataService {
    
    fileprivate let provider = MoyaProvider<CoronaService>(endpointClosure: { (target: CoronaService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type" : "charset=UTF-8"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func getCountryState(completion: @escaping ([Country]?, Error?) -> Void) {
        provider.request(.country) { (countryResponse) in
            switch countryResponse {
            case .success(let res):
                do {
                    let country = try JSONDecoder().decode([Country].self, from: res.data)
                    completion(country, nil)
                }
                catch let error as NSError {
                    completion(nil, error)
                }
            case .failure(let err):
                completion(nil, err)
            }
        }
    }
    
}
