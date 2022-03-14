//
//  DetailsViewModel.swift
//  SpaceX Missions
//
//  Created by Filipe Rodrigues Oliveira on 14/03/22.
//

import UIKit
protocol DetailsNavigationDelegate: AnyObject { }

protocol DetailsViewModelProtocol: AnyObject { }

class DetailsViewModel {
    private weak var navigationDelegate: DetailsNavigationDelegate?
    
    init(navigationDelegate: DetailsNavigationDelegate? = nil) {
        self.navigationDelegate = navigationDelegate
    }
}

//MARK: - HomeViewModelProtocol

extension DetailsViewModel: DetailsViewModelProtocol { }
