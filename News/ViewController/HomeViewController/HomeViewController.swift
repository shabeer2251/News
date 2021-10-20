//
//  HomeViewController.swift
//  News
//
//  Created by Muhammed Shabeer on 20/10/21.
//

import UIKit

class HomeViewController: UIViewController {
    private let viewModel: HomeViewModel

    @IBOutlet weak var tableView: UITableView!
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
        viewModel.reloadTableView = { [weak self] in
            DispatchQueue.main.async {
                DialogUtils.hideLoading()
                self?.tableView.reloadData()
            }
        }
    
        viewModel.getTrendingNews()
    }
    
    func setupUI() {
        DialogUtils.showLoading()
        tableView.backgroundColor = .appBackground
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HomeViewControllerTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeViewControllerTableViewCell")
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableView.automaticDimension
    }
}


extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeViewControllerTableViewCell", for: indexPath) as? HomeViewControllerTableViewCell else { return UITableViewCell() }
        let dataSource = self.viewModel.dataSource[indexPath.row]
        var image: UIImage?
        if let data = dataSource.imagedata {
            image = UIImage(data: data)
        }
        cell.delegate = viewModel
        cell.tag = indexPath.row
        cell.setupCell(title: dataSource.title, name: dataSource.author, description: dataSource.description, image: image)
        return cell
    }
}
