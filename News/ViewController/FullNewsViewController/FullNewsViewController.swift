//
//  FullNewsViewController.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit
import WebKit

class FullNewsViewController: UIViewController {
    private let viewModel: FullNewsViewModel
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: initialization
    init(viewModel: FullNewsViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Viewcontroller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModel()
    }

    
    @IBAction func closeButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func bindViewModel() {
        guard let urlString = viewModel.news.detailsUrl,  let url = URL(string:urlString) else { return }
        webView.load(URLRequest(url: url))
    }
    
    func setupUI() {
        StyleKit.applyMediumLabelStyle(label: titleLabel, color: .appLabel)
        titleLabel.text = viewModel.news.title
    }
    
}
