//
//  AnimationViewController.swift
//  News
//
//  Created by Muhammed Shabeer on 23/10/21.
//

import UIKit

class AnimationViewController: UIViewController {
    private let viewModel: AnimationViewModel
    @IBOutlet weak var squareView: UIView!
    @IBOutlet weak var tapToViewNewsListLabel: UILabel!
    
    // MARK: initialization
    init(viewModel: AnimationViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Viewcontroller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupInitialView()
        setupTapGestureRecognizer()
    }
    
    func setupTapGestureRecognizer() {
        let tapGestureForSquareView = UITapGestureRecognizer(target: self, action: #selector(animate(sender:)))
        let tapGestureForContentView = UITapGestureRecognizer(target: self, action: #selector(animate(sender: )))
        tapGestureForSquareView.name = TapGestureRecognizerName.squareView.rawValue
        tapGestureForContentView.name = TapGestureRecognizerName.contentView.rawValue
        squareView.addGestureRecognizer(tapGestureForSquareView)
        self.view.addGestureRecognizer(tapGestureForContentView)
    }
    
    func setupInitialView() {
        StyleKit.applyRegularLabelStyle(label: tapToViewNewsListLabel, color: .appLabel)
        tapToViewNewsListLabel.text = "Tap to view News List"
        tapToViewNewsListLabel.isHidden = true
        StyleKit.applyRoundCornersAndShadowAroundView(view: squareView, cornerRadius: 7)
        squareView.backgroundColor = UIColor.systemOrange
    }
    
    @objc
    func animate(sender: AnyObject) {
        guard let sender = sender as? UITapGestureRecognizer else {
            return
        }
        /// switching combination of viewstate and tapgesturename to decide whether to make animation or not.
        switch (viewModel.squareViewState, sender.name) {
        case (.initial, TapGestureRecognizerName.squareView.rawValue):
            UIView.animate(withDuration: 1.5) {
                let origtransform = self.squareView.transform
                ///calculating the xValue needed to move to centre
                let xValue = self.view.frame.width/2 - self.squareView.frame.maxX - self.squareView.frame.width/2
                let scaledtransform = origtransform.scaledBy(x: 2, y: 2).translatedBy(x: xValue, y: 0)
                self.squareView.transform = scaledtransform
                self.squareView.backgroundColor = UIColor.systemBlue
            }
            viewModel.squareViewState.next()
       
        case (.centre, TapGestureRecognizerName.squareView.rawValue):
            UIView.animate(withDuration: 1) {
                let origtransform = self.squareView.transform
                let width = UIScreen.main.bounds.width
                let height = UIScreen.main.bounds.height
                let curWidh = self.squareView.frame.width
                let curHeight = self.squareView.frame.height
                /// calculating the multiplier to scale to full screen
                let yval = height/curHeight
                let xVal = width/curWidh
                let scaledtransform = origtransform.scaledBy(x: xVal, y: yval)
                self.squareView.layer.cornerRadius = 0
                self.squareView.transform = scaledtransform
                self.squareView.backgroundColor = UIColor.black
            } completion: { result in
                self.squareView.isHidden = true
                self.view.backgroundColor = UIColor.black
                self.tapToViewNewsListLabel.isHidden = false
            }
            viewModel.squareViewState.next()
       
        case (.fullScreen, TapGestureRecognizerName.contentView.rawValue):
            self.dismiss(animated: true, completion: nil)
       
        default:
            break
        }
    }

}
