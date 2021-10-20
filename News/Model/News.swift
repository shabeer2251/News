//
//  News.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import Foundation

struct Article: Codable {
    var articles: [News]
    var status: String?
    enum codigKeys: String, CodingKey {
        case articles = "articles"
        case status = "status"
    }
}

struct News: Codable {
    var author: String?
    var title: String?
    var imageUrl: String?
    var content: String?
    var detailsUrl: String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case imageUrl = "urlToImage"
        case content = "content"
        case detailsUrl = "url"
    }
}
