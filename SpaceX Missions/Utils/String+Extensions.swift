//
//  String+Extensions.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 16/03/22.
//

import Foundation

extension String {
    var fromISO8601: String {
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "dd/MM/yyyy 'at' HH:mm"
        
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: self)
        return dateFormatterPrint.string(from: date ?? .now)
    }
}
