//
//  AnimationViewController.swift
//  News
//
//  Created by Muhammed Shabeer on 23/10/21.
//

import UIKit

class AnimationViewController: UIViewController {
    private let viewModel: AnimationViewModel

    // MARK: initialization
    init(viewModel: AnimationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
