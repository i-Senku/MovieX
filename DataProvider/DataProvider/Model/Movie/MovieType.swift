//
//  MovieType.swift
//  DataProvider
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public enum MovieType: String {
    case series
    case movie
    case unknown
}

extension MovieType: Codable {
    public init(from decoder: Decoder) throws {
        self = try MovieType(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}
