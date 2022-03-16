//
//  DetailsViewModel.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 14/03/22.
//

import UIKit
protocol DetailsNavigationDelegate: AnyObject { }

protocol DetailsViewModelProtocol: AnyObject {
    var name: String { get }
    var details: String { get }
    var date: String { get }
}

class DetailsViewModel {
    private let launch: Launch
    private let service: DetailsWorkerProtocol
    private weak var navigationDelegate: DetailsNavigationDelegate?
    let name: String
    let date: String
    let details: String
    
    init(launch: Launch,
         service: DetailsWorkerProtocol = DetailsWorker(),
         navigationDelegate: DetailsNavigationDelegate? = nil) {
        self.launch = launch
        self.service = service
        self.navigationDelegate = navigationDelegate
        self.name = launch.name ?? ""
        self.date = launch.dateLocal ?? ""
        self.details = launch.details ?? ""
        getRocket()
    }
}

//MARK: - HomeViewModelProtocol

extension DetailsViewModel: DetailsViewModelProtocol {
    func getRocket() {
        guard let id = launch.id else { return }
        service.requestRocket(id: id) { rocket, error in
            print(rocket?.name)
        }
    }
}
