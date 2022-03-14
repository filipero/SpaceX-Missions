//
//  HomeViewController.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 10/03/22.
//

import UIKit

final class HomeViewController: UIViewController {
    private lazy var baseView: HomeView = {
        let view = HomeView()
        return view
    }()
    
    let viewModel: HomeViewModelProtocol
    init(viewModel: HomeViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
        self.viewModel.dataSourceDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    
    override func loadView() {
        super.loadView()
        view = baseView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinds()
    }
    
    private func setupBinds() {
        title = viewModel.screenTitle
        viewModel.requestMissions()
    }
}

extension HomeViewController: DataSourceDelegate {
    func updateTableView() {
        DispatchQueue.main.async {
            self.baseView.tableView.dataSource = self.viewModel.missionDataSource
            self.baseView.tableView.reloadData()
        }
    }
}
