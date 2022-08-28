//
//  HomeRouter.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import UIKit
import DataProvider

final class HomeRouter {
    
    static func create() -> BaseNavigationController {
        let movieRepository = MovieRepository(omdbService: app.omdbService)
        let viewModel = HomeViewModel(movieRepository: movieRepository)
        let viewController = HomeViewController(viewModel: viewModel)
        let navigationController = BaseNavigationController(rootViewController: viewController)
        return navigationController
    }
}
