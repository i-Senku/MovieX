//
//  AppContainer.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation
import DataProvider

let app = AppContainer()

final class AppContainer {
    
    let router = AppRouter()
    let omdbService: OmdbServiceProtocol = OmdbService()
}
