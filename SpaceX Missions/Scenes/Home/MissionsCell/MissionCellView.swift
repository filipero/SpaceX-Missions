//
//  MissionCellView.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 13/03/22.
//

import UIKit

final class MissionCellView: UITableViewCell {
    static let identifier = "MissionCellView"
    let profileImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray.withAlphaComponent(0.2)
        view.tintColor = .gray.withAlphaComponent(0.2)
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 36
        view.clipsToBounds = true
        return view
    }()
    let nameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 18)
        return view
    }()
    let dateOfLaunchLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 12)
        return view
    }()
    private lazy var detailsStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [nameLabel,
                                                  dateOfLaunchLabel,
                                                  UIView()])
        view.axis = .vertical
        return view
    }()
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [profileImageView,
                                                  detailsStackView])
        view.spacing = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let cellBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.shadowRadius = 3
        view.layer.shadowOffset = CGSize(width: 2, height: 2)
        view.layer.shadowOpacity = 0.4
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Initialize
    
    override init(style: UITableViewCell.CellStyle,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupComponents() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(mainStackView)
        setupCell()
        installConstraints()
    }
    
    private func setupCell() {
        contentView.backgroundColor = .white
    }
    
    private func installConstraints() {
        NSLayoutConstraint.activate([
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellBackgroundView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            cellBackgroundView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            cellBackgroundView.heightAnchor.constraint(equalToConstant: 80),
            
            mainStackView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: 4),
            mainStackView.leadingAnchor.constraint(equalTo: cellBackgroundView.leadingAnchor, constant: 8),
            mainStackView.trailingAnchor.constraint(equalTo: cellBackgroundView.trailingAnchor, constant: -8),
            mainStackView.bottomAnchor.constraint(equalTo: cellBackgroundView.bottomAnchor, constant: -4),
            
            profileImageView.widthAnchor.constraint(equalToConstant: 72),
        ])
    }
}
