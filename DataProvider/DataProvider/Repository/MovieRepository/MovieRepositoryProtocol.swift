//
//  MovieRepositoryProtocol.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public protocol MovieRepositoryProtocol {
    func search(text: String, page: Int, completion: @escaping (Result<Search, MovieError>) -> Void)
}
