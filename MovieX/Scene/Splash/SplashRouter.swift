//
//  SplashRouter.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

final class SplashRouter {
    
    static func create() -> SplashViewController {
        let viewModel = SplashViewModel()
        let viewController = SplashViewController(viewModel: viewModel)
        viewModel.routeDelegate = viewController
        return viewController
    }
}
