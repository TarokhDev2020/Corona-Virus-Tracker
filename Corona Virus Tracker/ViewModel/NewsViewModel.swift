//
//  NewsViewModel.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

class NewsViewModel {
    
    // define some variables
    fileprivate let service = NewsDataService()
    var newsItem = [Article]()
    
    // define some functions
    func getNews(completion: @escaping (ViewModelState) -> Void) {
        service.getState { (news, err) in
            if let error = err {
                print(error)
                completion(.failure)
                return
            }
            for articles in news!.articles! {
                self.newsItem.append(articles)
            }
            completion(.success)
        }
    }
    
}
