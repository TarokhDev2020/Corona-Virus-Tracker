//
//  StateDataService.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import Moya

class StateDataService {
    
    fileprivate let provider = MoyaProvider<CoronaService>(endpointClosure: { (target: CoronaService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type" : "charset=UTF-8"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func getState(completion: @escaping (Corona?, Error?) -> Void) {
        provider.request(.all) { (stateResponse) in
            switch stateResponse {
            case .success(let res):
                do {
                    let state = try JSONDecoder().decode(Corona.self, from: res.data)
                    completion(state, nil)
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
