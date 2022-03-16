//
//  MissionCellViewModel.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 13/03/22.
//

import Foundation
import UIKit

struct MissionCellViewModel {
    let mission: Launch
    func configure(cell: MissionCellView) {
        cell.profileImageView.image = nil
        
        cell.dateOfLaunchLabel.text = mission.dateLocal?.fromISO8601
        cell.nameLabel.text = mission.name
        cell.profileImageView.downloaded(from: mission.links?.patch?.large ?? "")
    }
}
