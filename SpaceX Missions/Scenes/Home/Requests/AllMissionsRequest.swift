//
//  AllMissionsRequest.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 13/03/22.
//

import Foundation
import NetworkManager

public struct AllMissionsRequest {
    public init() { }
}

extension AllMissionsRequest: EndpointType {
    public var path: String {
        "/v4/launches/"
    }
    public var httpMethod: HTTPMethod {
        .get
    }
    public var task: HTTPTask {
        let parameters: [String: Any] = [:]
        return .requestParameters(bodyParameters: nil,
                                  bodyEncoding: .urlEncoding,
                                  urlParameters: parameters)
    }
    public var headers: HTTPHeaders? {
        nil
    }
}

// for unit tests
extension AllMissionsRequest: Equatable {}
