//
//  MovieDetailRouter.swift
//  MovieX
//
//  Created by Ercan Garip on 28.08.2022.
//

import DataProvider

final class MovieDetailRouter {
    
    static func create(movie: Movie) -> MovieDetailViewController {
        let movieRepository = MovieRepository(omdbService: app.omdbService)
        let viewModel = MovieDetailViewModel(movie: movie, movieRepository: movieRepository)
        let viewController = MovieDetailViewController(viewModel: viewModel)
        return viewController
    }
}
