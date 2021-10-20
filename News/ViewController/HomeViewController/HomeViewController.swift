//
//  HomeViewController.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel

    // MARK: initialization
    init(viewModel: HomeViewModel) {
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

    func bindViewModel() {
        
    }
    
    func setupUI() {
        
    }
}
