//
//  CoronaService.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation
import Moya

enum CoronaService {
    case all
    case country
    case news
}

extension CoronaService: TargetType {
    
    var baseURL: URL {
        switch self {
        case .all:
            return URL(string: "https://disease.sh/v3/covid-19")!
        case .country:
            return URL(string: "https://disease.sh/v3/covid-19")!
        case .news:
            return URL(string: "https://newsapi.org/v2")!
        }
    }
    
    var path: String {
        switch self {
        case .all:
            return "/all"
        case .country:
            return "/countries"
        case .news:
            return "/top-headlines"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .all:
            return .get
        case .country:
            return .get
        case .news:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        case .all:
            return Data()
        case .country:
            return Data()
        case .news:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        case .all:
            return .requestPlain
        case .country:
            return .requestPlain
        case .news:
            return .requestParameters(parameters: ["country": "us", "category": "health", "apiKey": "YOUR API KEY"], encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
}
