//
//  DetailsViewController.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 14/03/22.
//

import UIKit

final class DetailsViewController: UIViewController {
    private lazy var baseView: DetailsView = {
        let view = DetailsView()
        return view
    }()
    
    let viewModel: DetailsViewModelProtocol
    init(viewModel: DetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: .main)
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
        baseView.nameLabel.text = viewModel.name
        baseView.detailsLabel.text = viewModel.details
        baseView.dateLabel.text = viewModel.date.fromISO8601
    }
}
