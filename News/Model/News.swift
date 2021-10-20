//
//  News.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import Foundation

class Article: Codable {
    var articles: [News]
    var status: String?
    enum codigKeys: String, CodingKey {
        case articles = "articles"
        case status = "status"
    }
}

class News: Codable {
    var author: String?
    var title: String?
    var imageUrl: String?
    var content: String?
    var detailsUrl: String?
    var description: String?
    var imagedata: Data?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case imageUrl = "urlToImage"
        case content = "content"
        case detailsUrl = "url"
        case description = "description"
    }
}
