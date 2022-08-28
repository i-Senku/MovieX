//
//  MovieCellModel.swift
//  UIComponents
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation

public protocol MovieCellDataSource: AnyObject {
    var poster: String? { get set }
    var title: String? { get set }
    var posterUrl: URL? { get }
}

public protocol MovieCellEventSource: AnyObject {
    
}

public protocol MovieCellProtocol: MovieCellDataSource, MovieCellEventSource {
    
}

public final class MovieCellModel: MovieCellProtocol {
    
    public var poster: String?
    public var title: String?
    
    public init(poster: String?, title: String?) {
        self.poster = poster
        self.title = title
    }
}

// MARK: - DataSource
extension MovieCellModel {
    
    public var posterUrl: URL? {
        guard let poster = poster else {
            return nil
        }
        if poster == "N/A" {
            return nil
        } else {
            return URL(string: poster)
        }
    }
}
