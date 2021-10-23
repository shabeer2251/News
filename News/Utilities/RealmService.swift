//
//  RealmHelper.swift
//  News
//
//  Created by Muhammed Shabeer on 21/10/21.
//

import Foundation
import RealmSwift

public class RealmService {
    public static func sharedInstance() -> Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch let error as NSError {
            print("Error creating Realm sharedinstance : \(error.debugDescription)")
        }
        return nil
    }
}
