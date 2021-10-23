//
//  HomeViewControllerTableSectionHeaderView.swift
//  News
//
//  Created by Muhammed Shabeer on 23/10/21.
//

import UIKit

protocol AnimationScreenNavigationDelegate: class{
    func viewAnimationTapped()
}

class HomeViewControllerTableSectionHeaderView: UITableViewHeaderFooterView {
    @IBOutlet weak var tapHereButton: UIButton!
    weak var delegate: AnimationScreenNavigationDelegate?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    @IBAction func viewAnimationTapped(_ sender: Any) {
        delegate?.viewAnimationTapped()
    }
    
    
    func setupUI() {
        self.backgroundColor = .appBackground
        StyleKit.applyRoundCornerTheme(button: tapHereButton, title: "Tap here for animation")
    }
}
