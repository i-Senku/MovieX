//
//  MovieDetailViewModel.swift
//  MovieX
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation
import DataProvider
import UIKit
import FirebaseAnalytics
import Firebase

protocol MovieDetailViewDataSource {
    var posterImage: URL? { get }
    var title: String? { get }
    var actors: String? { get }
    var year: String? { get }
}

protocol MovieDetailViewEventSource {
    var updateScene: VoidClosure? { get set }
}

protocol MovieDetailViewProtocol: MovieDetailViewDataSource, MovieDetailViewEventSource {
    func viewDidLoad()
    func showInImdb()
}

final class MovieDetailViewModel: BaseViewModel, MovieDetailViewProtocol {
    
    // Privates
    private var movieDetail: MovieDetail?
    private var movie: Movie
    private var movieRepository: MovieRepositoryProtocol
    
    // EventSource
    var updateScene: VoidClosure?
    
    init(movie: Movie, movieRepository: MovieRepositoryProtocol) {
        self.movie = movie
        self.movieRepository = movieRepository
    }
    
    func viewDidLoad() {
        getMovieDetail()
    }
    
    func showInImdb() {
        guard let imdbId = movie.imdbId else { return }
        if let url = URL(string: "https://www.imdb.com/title/\(imdbId)") {
            UIApplication.shared.open(url)
        }
    }
}

// MARK: - DataSource
extension MovieDetailViewModel {
    
    var posterImage: URL? {
        return movie.poster?.supportedUrl
    }
    
    var title: String? {
        return movieDetail?.title
    }
    
    var actors: String? {
        return movieDetail?.actors
    }
    
    var year: String? {
        return movieDetail?.released
    }
}

// MARK: - DataProvider
extension MovieDetailViewModel {
    
    private func getMovieDetail() {
        guard let imdbId = movie.imdbId else { return }
        showLoading?()
        movieRepository.movieDetail(imdbId: imdbId) { [weak self] result in
            guard let self = self else { return }
            self.hideLoading?()
            switch result {
            case .success(let movieDetail):
                self.movieDetail = movieDetail
                self.logEvent(detail: movieDetail)
                self.updateScene?()
            case .failure(let error):
                EntryKitHelper.show(error.message, type: .error)
            }
        }
    }
    
    private func logEvent(detail: MovieDetail) {
        Analytics.logEvent("MovieDetail", parameters: [
            "movieId": detail.imdbID ?? "",
            "movieName": detail.title ?? "",
        ])
    }
}
