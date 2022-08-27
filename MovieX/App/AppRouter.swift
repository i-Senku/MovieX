//
//  AppRouter.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import UIKit

final class AppRouter {
    
    var window: UIWindow?
    
    init() {}
    
    func start() {
        guard let window = window else {
            fatalError("Window value cannot be nil")
        }
        let viewController = SplashRouter.create()
        window.rootViewController = viewController
    }
}
