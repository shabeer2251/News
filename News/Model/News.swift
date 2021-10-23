//
//  News.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import Foundation
import RealmSwift

class Article: Codable {
    var articles: [News]
    var status: String?
    enum codigKeys: String, CodingKey {
        case articles = "articles"
        case status = "status"
    }
}

class News: Object, Codable {
    @objc dynamic var author: String?
    @objc dynamic var title: String?
    @objc dynamic var imageUrl: String?
    @objc dynamic var content: String?
    @objc dynamic var detailsUrl: String?
    @objc dynamic var newsDescription: String?
    @objc dynamic var imagedata: Data?
    @objc dynamic var publishedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case author = "author"
        case title = "title"
        case imageUrl = "urlToImage"
        case content = "content"
        case detailsUrl = "url"
        case newsDescription = "description"
        case publishedAt = "publishedAt"
    }
}
