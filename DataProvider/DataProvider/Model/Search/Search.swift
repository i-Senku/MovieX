//
//  Search.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public struct Search: Decodable {
    
    public let response: String
    public let error: String?
    public let movieList: [Movie]?
    public let totalResult: String?
    
    enum CodingKeys: String, CodingKey {
        case response = "Response"
        case error = "Error"
        case movieList = "Search"
        case totalResult = "totalResults"
    }
    
    public var responseStatus: Bool {
        if response == "True" {
            return true
        } else {
            return false
        }
    }
    
    public var totalCount: Int {
        if let count = Int(totalResult ?? "0") {
            return count
        } else {
            return 0
        }
    }
}
