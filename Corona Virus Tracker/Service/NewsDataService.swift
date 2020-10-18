//
//  NewsDataService.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import Moya

class NewsDataService {
    
    fileprivate let provider = MoyaProvider<CoronaService>(endpointClosure: { (target: CoronaService) -> Endpoint in
        let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
        switch target {
        default:
            let httpHeaderFields = ["Content-Type" : "charset=UTF-8"]
            return defaultEndpoint.adding(newHTTPHeaderFields: httpHeaderFields)
        }
    })
    
    func getState(completion: @escaping (News?, Error?) -> Void) {
        provider.request(.news) { (newsResponse) in
            switch newsResponse {
            case .success(let res):
                do {
                    let news = try JSONDecoder().decode(News.self, from: res.data)
                    completion(news, nil)
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
