//
//  HomeViewControllerTableViewCell.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit

protocol SeeFullNewsDelegate: class {
    func seeFullNewsTapped(index: Int)
}

class HomeViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var backGroundView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var seeFullNewsButton: UIButton!
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    weak var delegate: SeeFullNewsDelegate?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    
    @IBAction func seeFullNewsButtonTapped(_ sender: Any) {
        self.delegate?.seeFullNewsTapped(index: self.tag)
    }
    
    func setupUI() {
        StyleKit.applyRoundCornersAndShadowAroundView(view: backGroundView)
        StyleKit.applyMediumLabelStyle(label: nameLabel, color: .appLabel)
        StyleKit.applyBoldLabelStyle(label: titleLabel, color: .appLabel)
        StyleKit.applyRegularLabelStyle(label: descriptionLabel, color: .appLabel)
        StyleKit.applyRoundCornerTheme(button: seeFullNewsButton, title: "See Full News")
        backGroundView?.backgroundColor = UIColor.appContentBox
    }
    
    func setupCell(title: String?, name: String?, description: String?, image: UIImage?) {
        titleLabel.text = title
        nameLabel.text = name
        descriptionLabel.text = description
        newsImageView.image = image
        imageViewHeightConstraint.constant = image == nil ? 0 : 160
    }
}
