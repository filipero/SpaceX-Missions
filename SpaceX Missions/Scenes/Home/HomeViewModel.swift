//
//  HomeViewModel.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 10/03/22.
//

import UIKit

protocol HomeNavigationDelegate: AnyObject {
    func goToDetailsScreen(launch: Launch)
}

protocol HomeViewModelProtocol: AnyObject {
    var screenTitle: String { get }
    var dataSourceDelegate: DataSourceDelegate? { get set }
    var missionDataSource: TableViewDataSource<MissionCellViewModel> { get }
    
    func requestMissions()
    func goToDetailsScreen(launch: Launch)
}

protocol DataSourceDelegate: AnyObject {
    func updateTableView()
}

class HomeViewModel {
    private var service: HomeWorkerProtocol
    private weak var navigationDelegate: HomeNavigationDelegate?
    weak var dataSourceDelegate: DataSourceDelegate?
    let screenTitle: String = "Missions"
    var missionDataSource: TableViewDataSource<MissionCellViewModel> = .make(for: [])
    
    init(service: HomeWorkerProtocol = HomeWorker(),
         navigationDelegate: HomeNavigationDelegate?) {
        self.service = service
        self.navigationDelegate = navigationDelegate
    }
}

//MARK: - HomeViewModelProtocol

extension HomeViewModel: HomeViewModelProtocol {
    func requestMissions() {
        service.requestMissions { missions, error in
            guard let missions = missions else { return }
            let missionModels = missions.map { mission in
                MissionCellViewModel(mission: mission)
            }
            self.missionDataSource = .make(for: missionModels)
            self.dataSourceDelegate?.updateTableView()
        }
    }
    
    func goToDetailsScreen(launch: Launch) {
        navigationDelegate?.goToDetailsScreen(launch: launch)
    }
}

fileprivate extension TableViewDataSource where Model == MissionCellViewModel {
    static func make(for models: [MissionCellViewModel], reuseIdentifier: String = MissionCellView.identifier) -> TableViewDataSource<Model> {
        TableViewDataSource(models: models,
                            reuseIdentifier: MissionCellView.identifier) { model, cell in
            if let cell = cell as? MissionCellView {
                model.configure(cell: cell)
            }
        }
    }
}
