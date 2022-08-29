//
//  MovieXTests.swift
//  MovieXTests
//
//  Created by Ercan Garip on 29.08.2022.
//

import XCTest
@testable import MovieX
@testable import DataProvider

class MovieXTests: XCTestCase {

    private var service: MockOmdbService!
    private var movieDetailViewModel: MovieDetailViewModel!
    private var movieDetailViewController: MovieDetailViewController!
    private var movieRepository: MovieRepositoryProtocol!
    
    override func setUpWithError() throws {
        service = MockOmdbService()
        movieRepository = MovieRepository(omdbService: service)
    }

    func testDetail() throws {
        
        // Given
        let movieDetail = try MockLoader.loadJson(fileName: "movie_detail", type: MovieDetail.self)
        let searchResponse = try MockLoader.loadJson(fileName: "movies", type: Search.self)
        XCTAssertNotNil(movieDetail)
        XCTAssertNotNil(searchResponse)
        
        movieDetailViewModel = MovieDetailViewModel(movie: (searchResponse.movieList?.first)!, movieRepository: movieRepository)
        movieDetailViewController = MovieDetailViewController(viewModel: movieDetailViewModel)
        
        service.movieDetail = movieDetail
        service.searchResponse = searchResponse
        
        // When
        movieDetailViewController.viewDidLoad()
        
        // Then
        XCTAssertEqual(movieDetailViewModel.title, "Naruto: Shippûden")
        XCTAssertEqual(movieDetailViewModel.year, "28 Oct 2009")
        XCTAssertEqual(movieDetailViewModel.actors, "Alexandre Crepet, Junko Takeuchi, Maile Flanagan")
    }
}
