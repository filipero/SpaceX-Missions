//
//  RocketRequest.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 16/03/22.
//

import Foundation
import NetworkManager

public struct RocketRequest {
    let id: String
    public init(id: String) {
        self.id = id
    }
}

extension RocketRequest: EndpointType {
    public var path: String {
        "/v4/rockets/"
    }
    public var httpMethod: HTTPMethod {
        .get
    }
    public var task: HTTPTask {
        var parameters: [String: Any] = [:]
        parameters["id"] = id
        return .requestParameters(bodyParameters: nil,
                                  bodyEncoding: .urlEncoding,
                                  urlParameters: parameters)
    }
    public var headers: HTTPHeaders? {
        nil
    }
}

// for unit tests
extension RocketRequest: Equatable {}
