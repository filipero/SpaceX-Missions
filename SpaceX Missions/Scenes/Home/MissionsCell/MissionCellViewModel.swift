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

        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy"
        
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: mission.dateLocal ?? "")
        cell.dateOfLaunchLabel.text = dateFormatterPrint.string(from: date ?? .now)
        cell.nameLabel.text = mission.name
        cell.profileImageView.downloaded(from: mission.links?.patch?.large ?? "")
    }
}
