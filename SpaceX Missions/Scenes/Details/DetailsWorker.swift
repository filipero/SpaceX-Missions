//
//  DetailsWorker.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 16/03/22.
//

import Foundation
import NetworkManager

protocol DetailsWorkerProtocol: AnyObject {
    func requestRocket(id: String, result: @escaping (Rocket?, Error?) -> ())
}

class DetailsWorker {
    let networkManager: NetworkManager
    init(networkRouter: NetworkRouter = NetworkRouter()) {
        self.networkManager = NetworkManager(router: networkRouter)
    }
}

extension DetailsWorker: DetailsWorkerProtocol {
    func requestRocket(id: String, result: @escaping (Rocket?, Error?) -> ()) {
        networkManager.request(with: RocketRequest(id: id)) { (response: Result<Rocket?, Error>) in
            switch response {
            case .success(let response):
                result(response, nil)
            case .failure(let error):
                result(nil, error)
            }
        }
    }
}
