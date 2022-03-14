//
//  HomeView.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 10/03/22.
//

import UIKit

final class HomeView: BaseView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.register(MissionCellView.self, forCellReuseIdentifier: MissionCellView.identifier)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  //MARK: - Initialize
  override func initialize() {
      backgroundColor = .white
      addSubview(tableView)
  }
  
  //MARK: - Constraints

  override func installConstraints() {
      NSLayoutConstraint.activate([
        tableView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
        tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      ])
  }
}

