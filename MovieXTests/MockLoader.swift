//
//  MockLoader.swift
//  MovieXTests
//
//  Created by Ercan Garip on 29.08.2022.
//

import Foundation

enum MocableError: Error {
  case fileNotFound
}

final class MockLoader {
    
    static var bundle: Bundle {
        return Bundle(for: self)
    }
    
    static func loadJson<T: Decodable>(fileName: String, type: T.Type) throws -> T {
        guard let path = bundle.url(forResource: fileName, withExtension: "json") else {
            throw MocableError.fileNotFound
        }
        let data = try Data(contentsOf: path)
        let decodedObject = try JSONDecoder().decode(T.self, from: data)
        return decodedObject
    }
}
