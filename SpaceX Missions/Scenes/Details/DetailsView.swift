//
//  DetailsView.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 14/03/22.
//

import UIKit

final class DetailsView: BaseView {
    let nameLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    let detailsLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    let dateLabel: UILabel = {
        let view = UILabel()
        return view
    }()
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameLabel,
                                                  detailsLabel,
                                                  dateLabel])
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
  //MARK: - Initialize
  override func initialize() {
      backgroundColor = .white
      addSubview(mainStackView)
  }
  
  //MARK: - Constraints
  override func installConstraints() {
      NSLayoutConstraint.activate([
        mainStackView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
        mainStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 8),
        mainStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -8),
        mainStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      ])
  }
}

