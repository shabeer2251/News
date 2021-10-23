//
//  DialogUtils.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit
import SVProgressHUD

class DialogUtils {
    static func showLoading() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
            SVProgressHUD.show(withStatus: "Loading...")
            SVProgressHUD.setDefaultMaskType(.black)
        }
    }
    
    static func hideLoading() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
