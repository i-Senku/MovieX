//
//  HomeRouter.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

final class HomeRouter {
    
    static func create() -> HomeViewController {
        let viewModel = HomeViewModel()
        let viewController = HomeViewController(viewModel: viewModel)
        return viewController
    }
}
