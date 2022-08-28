//
//  OmdbClient.swift
//  DataProvider
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation

public enum OmdbAPI : BaseClientGenerator {
    
    // MARK: - Requests
    case search(text: String, page: Int)
    case movieDetail(imdbId: String)
    
    public var scheme: String { "https" }
    
    public var host: String { "omdbapi.com" }
    
    // MARK: - PATH
    public var path: String {
        switch self {
        default:
            return "/"
        }
    }
    
    //MARK: - Query Items
    public var queryItems: [URLQueryItem]?{
        var items: [URLQueryItem] = [.init(name: "apiKey", value: RemoteConstants.apiKey)]
        switch self {
        case .search(let text, let page):
            items.append(.init(name: "s", value: text))
            items.append(.init(name: "page", value: String(page)))
        case .movieDetail(let imdbId):
            items.append(.init(name: "i", value: imdbId))
        }
        return items
    }
    
    //MARK: - Default GET
    public var method: HttpMethod{
        switch self {
        default:
            return .get
        }
    }
    
    // MARK: - HEADER
    public var header: [HttpHeader]? {
        return [
            .contentType(),
        ]
    }
    
    //MARK: - Default Nil
    public var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
