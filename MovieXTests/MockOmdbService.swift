//
//  MockOmdbService.swift
//  MovieXTests
//
//  Created by Ercan Garip on 29.08.2022.
//

import Foundation
@testable import DataProvider

final class MockOmdbService: OmdbServiceProtocol {
    
    public var searchResponse: Search?
    public var movieDetail: MovieDetail?
    
    public func searchMovie(text: String, page: Int, completion: @escaping (Result<Search, NetworkError>) -> Void) {
        if let searchResponse = searchResponse {
            return completion(.success(searchResponse))
        } else {
            return completion(.failure(.noData))
        }
    }
    
    public func movieDetail(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        if let movieDetail = movieDetail {
            return completion(.success(movieDetail))
        } else {
            return completion(.failure(.noData))
        }
    }
}
