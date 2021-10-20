//
//  NetworkService.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import Foundation

class NetworkService {
    private static var instance: NetworkService?
    
    class func sharedInstance() -> NetworkService {
        if instance == nil {
            instance = NetworkService()
        }
        return instance ?? NetworkService()
    }
    
    private init() {
        
    }
     
    func getTrendingNews(callBack: @escaping (_ news: [News]?,_ error: Error?) -> Void) {
        let baseUrl = Constants.getBaseUrl
        let endPoint = "top-headlines"
        let apiKey = Constants.getApiAccessKey
        guard let url = URL(string: baseUrl + endPoint + "?country=in&apikey=" + apiKey) else { return }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                callBack(nil, error)
            } else {
                guard let data = data else {
                    callBack(nil, error)
                    return }
                do {
                    let result = try JSONDecoder().decode(Article.self, from: data)
                    callBack(result.articles, nil)
                } catch {
                   callBack(nil, error)
                }
            }
        }.resume()
    }
}
