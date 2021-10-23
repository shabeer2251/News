//
//  HomeViewModel.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit
import RealmSwift

protocol HomeViewnavigationDelegate: AnyObject {
    func handleSeeFullNewsTapped(news: News)
    func handleViewAnimation()
}


class HomeViewModel: NSObject {
    var dataSource = List<News>()
    var reloadTableView: (() -> Void)?
    var showHideLoading: ((_ shouldShow: Bool) -> Void)?
    var numberOfTimesDownloadCalled = 0
    var numberOfTimesDownloadCallBackReceived = 0
    weak var navigationDelegate: HomeViewnavigationDelegate?
        
     init(delegate: HomeViewnavigationDelegate) {
        super.init()
        self.navigationDelegate = delegate
        self.setupStoredData()
    }
    
    
    func setupStoredData() {
        let realm = RealmService.sharedInstance()
        if let allNews = realm?.objects(News.self).sorted(by: { $0.author?.lowercased() ?? "" < $1.author?.lowercased() ?? "" }) {
            dataSource.removeAll()
            dataSource.append(objectsIn: allNews)
            if !allNews.isEmpty {
                self.reloadTableView?()
            }
        }
        checkForUpdatesInBackground()
    }
    
    
    func setupData(news: [News]) {
        self.showHideLoading?(true)
        let newsList = news.sorted(by: { $0.author?.lowercased() ?? "" < $1.author?.lowercased() ?? "" })
        dataSource.removeAll()
        dataSource.append(objectsIn: newsList)
        for i in 0 ..< dataSource.count {
            if let imageUrl = dataSource[i].imageUrl {
                numberOfTimesDownloadCalled += 1
                self.downloadImage(imageUrl: imageUrl, index: i)
            }
        }
    }
    
    func shouldUpdateNewsList(news: [News]) -> Bool {
        /// get last published date from api response
        guard let lastPublishedDate = news.sorted(by: { (($0.publishedAt ?? "").toDate ?? Date(timeIntervalSince1970: 0)) > (($1.publishedAt ?? "").toDate ?? Date(timeIntervalSince1970: 0))}).first?.publishedAt?.toDate else {
            return true }
        guard let realm = RealmService.sharedInstance() else {
            return true
        }
        ///get last published date stored in db
        guard let lastPublishedDateInDB = Array(realm.objects(News.self)).sorted(by: { (($0.publishedAt ?? "").toDate ?? Date(timeIntervalSince1970: 0)) > (($1.publishedAt ?? "").toDate ?? Date(timeIntervalSince1970: 0))}).first?.publishedAt?.toDate else {
            return true
        }
        /// update news list if latest publishedAt parameter in api is greater than the one in db
        if lastPublishedDate > lastPublishedDateInDB {
             return true
        }
        return false
    }
    
    
    func checkForUpdatesInBackground() {
        NetworkService.sharedInstance().getTrendingNews {[weak self] news, error in
            guard let self = self else { return }
            if error != nil {
                print("error fetching the data")
            } else {
                guard let news = news else { return }
                if self.shouldUpdateNewsList(news: news) {
                    self.setupData(news: news)
                }
            }
        }
    }
        
    func writeToDB() {
        guard let realm = RealmService.sharedInstance() else {
            print("no realm instance")
            return
        }
        try? realm.write {
            let objects = realm.objects(News.self)
            realm.delete(objects)
            realm.add(self.dataSource)
        }
    }
        
    func fetchData(at index: Int) -> News? {
        guard let realm = RealmService.sharedInstance() else {
            print("no realm instance")
            return nil
        }
        let object = Array(realm.objects(News.self))[safe: index]
        return object
    }
    
    
    func downloadImage(imageUrl: String?, index: Int) {
        NetworkService.sharedInstance().getImage(url: imageUrl) { [weak self] imageData, error in
            guard let self = self else { return }
            self.numberOfTimesDownloadCallBackReceived += 1
            self.dataSource[index].imagedata = imageData
            if self.numberOfTimesDownloadCalled == self.numberOfTimesDownloadCallBackReceived {
                self.writeToDB()
                self.reloadTableView?()
            }
        }
    }
}

extension HomeViewModel: SeeFullNewsDelegate {
    func seeFullNewsTapped(index: Int) {
        guard let news = self.fetchData(at: index) else { return }
        self.navigationDelegate?.handleSeeFullNewsTapped(news: news)
    }
}

extension HomeViewModel: AnimationScreenNavigationDelegate {
    func viewAnimationTapped() {
        self.navigationDelegate?.handleViewAnimation()
    }
    
}
