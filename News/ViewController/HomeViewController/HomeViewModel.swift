//
//  HomeViewModel.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit

protocol HomeViewnavigationDelegate: AnyObject {
    func handleSeeFullNewsTapped(news: News)
}

class HomeViewModel: NSObject {
    var dataSource: [News] = []
    var reloadTableView: (() -> Void)?
    var numberOfTimesDownloadCalled = 0
    var numberOfTimesDownloadCallBackReceived = 0
    weak var navigationDelegate: HomeViewnavigationDelegate?
    
     init(delegate: HomeViewnavigationDelegate) {
        self.navigationDelegate = delegate
    }
    
    
    func setupDataSource(news: [News]) {
        dataSource = news.sorted(by: { $0.author?.lowercased() ?? "" < $1.author?.lowercased() ?? "" })
        for i in 0 ..< dataSource.count {
            numberOfTimesDownloadCalled += 1
            self.downloadImage(imageUrl: dataSource[i].imageUrl, index: i)
        }
    }
    
    func getTrendingNews() {
        NetworkService.sharedInstance().getTrendingNews {[weak self] news, error in
            if error != nil {
                print("error fetching the data")
            } else {
                guard let news = news else { return }
                self?.setupDataSource(news: news)
            }
        }
    }
    
    func downloadImage(imageUrl: String?, index: Int) {
        NetworkService.sharedInstance().getImage(url: imageUrl) { imageData, error in
            self.numberOfTimesDownloadCallBackReceived += 1
            self.dataSource[index].imagedata = imageData
            if self.numberOfTimesDownloadCalled == self.numberOfTimesDownloadCallBackReceived {
                self.reloadTableView?()
            }
        }
    }
}

extension HomeViewModel: SeeFullNewsDelegate {
    func seeFullNewsTapped(index: Int) {
        self.navigationDelegate?.handleSeeFullNewsTapped(news: dataSource[index])
    }
}
