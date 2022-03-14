//
//  Launch.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 13/03/22.
//

import Foundation

// MARK: - Launch
struct Launch: Codable {
    let fairings: Fairing?
    let links: Links?
    let staticFireDateUTC: String?
    let staticFireDateUnix: Int?
    let tdb, net: Bool?
    let window: Int?
    let rocket: String?
    let success: Bool?
    let failures: [Failure]?
    let details: String?
    let crew, ships: [String]?
    let capsules, payloads: [String]?
    let launchpad: String?
    let autoUpdate: Bool?
    let flightNumber: Int?
    let name, dateUTC: String?
    let dateUnix: Int?
    let dateLocal: String?
    let datePrecision: String?
    let upcoming: Bool?
    let cores: [Core]?
    let id: String?

    enum CodingKeys: String, CodingKey {
        case fairings, links
        case staticFireDateUTC = "static_fire_date_utc"
        case staticFireDateUnix = "static_fire_date_unix"
        case tdb, net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
        case autoUpdate = "auto_update"
        case flightNumber = "flight_number"
        case name
        case dateUTC = "date_utc"
        case dateUnix = "date_unix"
        case dateLocal = "date_local"
        case datePrecision = "date_precision"
        case upcoming, cores, id
    }
}

// MARK: - Core
struct Core: Codable {
    let core: String?
    let flight: Int?
    let gridfins, legs, reused, landingAttempt: Bool?
    let landingSuccess: Bool?
    let landingType, landpad: String?

    enum CodingKeys: String, CodingKey {
        case core, flight, gridfins, legs, reused
        case landingAttempt = "landing_attempt"
        case landingSuccess = "landing_success"
        case landingType = "landing_type"
        case landpad
    }
}

// MARK: - Links
struct Links: Codable {
    let patch: Patch?
    let reddit: Reddit?
    let flickr: Flickr?
    let presskit: String?
    let webcast: String?
    let youtubeID: String?
    let article, wikipedia: String?

    enum CodingKeys: String, CodingKey {
        case patch, reddit, flickr, presskit, webcast
        case youtubeID = "youtube_id"
        case article, wikipedia
    }
}

// MARK: - Flickr
struct Flickr: Codable {
    let small: [String]?
    let original: [String]?
}

// MARK: - Patch
struct Patch: Codable {
    let small, large: String?
}

// MARK: - Reddit
struct Reddit: Codable {
    let campaign, launch, media, recovery: String?
}

// MARK: - Fairing
struct Fairing: Codable {
    let reused, recoveryAttempt, recovered: Bool?
    let ships: [String]?

    enum CodingKeys: String, CodingKey {
        case reused
        case recoveryAttempt = "recovery_attempt"
        case recovered, ships
    }
}
// MARK: - Failure
struct Failure: Codable {
    let time, altitude: Int?
    let reason: String?
}
