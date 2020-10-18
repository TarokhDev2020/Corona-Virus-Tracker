//
//  News.swift
//  Corona Virus Tracker
//
//  Created by Tarokh on 9/13/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import Foundation

struct News: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var title: String?
    var url: String?
    var urlToImage: String?
    var description: String?

    enum CodingKeys: String, CodingKey {
        case source, title
        case url, urlToImage
        case description = "description"
    }
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
}
