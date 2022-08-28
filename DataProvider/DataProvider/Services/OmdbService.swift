//
//  OmdbService.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

final public class OmdbService: OmdbServiceProtocol {
    
    public init() {
        
    }
    
    public func searchMovie(text: String, page: Int, completion: @escaping (Result<Search, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(
            route: OmdbAPI.search(text: text, page: page),
            responseModel: Search.self,
            completion: completion)
    }
    
    public func movieDetail(imdbId: String, completion: @escaping (Result<MovieDetail, NetworkError>) -> Void) {
        NetworkExecuter.shared.execute(route: OmdbAPI.movieDetail(imdbId: imdbId), responseModel: MovieDetail.self, completion: completion)
    }
}
