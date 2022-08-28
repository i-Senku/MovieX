//
//  MovieDetail.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public struct MovieDetail: Decodable {
    
    public let title: String?
    public let year: String?
    public let rated: String?
    public let released: String?
    public let runtime: String?
    public let genre: String?
    public let director: String?
    public let writer: String?
    public let actors: String?
    public let plot: String?
    public let language: String?
    public let country: String?
    public let awards: String?
    public let poster: String?
    public let metascore: String?
    public let imdbRating: String?
    public let imdbVotes: String?
    public let imdbID: String?
    public let production: String?
    public let website: String?
    public let response: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating
        case imdbVotes
        case imdbID
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
    
    public var responseStatus: Bool {
        if response == "True" {
            return true
        } else {
            return false
        }
    }
}
