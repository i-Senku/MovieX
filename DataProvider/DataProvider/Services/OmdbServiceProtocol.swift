//
//  OmdbServiceContracts.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public protocol OmdbServiceProtocol {
    func searchMovie(text: String, page: Int, completion: @escaping (Result<Search, NetworkError>) -> Void)
}
