//
//  MovieRepository.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

final public class MovieRepository: MovieRepositoryProtocol {
    
    private var omdbService : OmdbServiceProtocol
    
    //MARK: - Inject OmdbServiceProtocol
    public init(omdbService : OmdbServiceProtocol) {
        self.omdbService = omdbService
    }
    
    public func search(text: String,
                       page: Int,
                       completion: @escaping (Result<Search, MovieError>) -> Void) {
        
        omdbService.searchMovie(text: text, page: page) { result in
            switch result {
            case .success(let searchResponse):
                if searchResponse.responseStatus {
                    return completion(.success(searchResponse))
                } else {
                    return completion(.failure(MovieError(message: searchResponse.error ?? "Something went wrong")))
                }
            case .failure(let error):
                return completion(.failure(MovieError(message: error.localizedDescription)))
            }
        }
    }
}
