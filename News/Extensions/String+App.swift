//
//  String+App.swift
//  News
//
//  Created by Muhammed Shabeer on 23/10/21.
//

import UIKit

extension String {
    var toDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from: self)
    }
    
}
