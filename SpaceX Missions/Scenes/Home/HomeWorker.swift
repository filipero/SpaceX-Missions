//
//  HomeWorker.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 13/03/22.
//

import Foundation
import NetworkManager

protocol HomeWorkerProtocol: AnyObject {
    func requestMissions(result: @escaping ([Launch]?, Error?) -> ())
}

class HomeWorker {
    let networkManager: NetworkManager
    init(networkRouter: NetworkRouter = NetworkRouter()) {
        self.networkManager = NetworkManager(router: networkRouter)
    }
}

extension HomeWorker: HomeWorkerProtocol {
    func requestMissions(result: @escaping ([Launch]?, Error?) -> ()) {
        networkManager.request(with: AllMissionsRequest()) { (response: Result<[Launch]?, Error>) in
            switch response {
            case .success(let response):
                result(response, nil)
            case .failure(let error):
                result(nil, error)
            }
        }
    }
}
