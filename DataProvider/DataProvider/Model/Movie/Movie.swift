//
//  Movie.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public struct Movie: Decodable {
    
    public let title: String?
    public let year: String?
    public let type: MovieType?
    public let imdbId: String?
    public let poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case type = "Type"
        case year = "Year"
        case imdbId = "imdbID"
        case poster = "Poster"
    }
}
