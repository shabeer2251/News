//
//  HomeViewModel.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import Foundation

class HomeViewModel {
    var dataSource: [News]?
    var reloadTableView: (() -> Void)?
    
    func  setupDataSource() {
       
    }
    
    func getTrendingNews() {
        NetworkService.sharedInstance().getTrendingNews {[weak self] news, error in
            if error != nil {
                print("error fetching the data")
            } else {
                print(news)
            }
            
        }
    }
}
