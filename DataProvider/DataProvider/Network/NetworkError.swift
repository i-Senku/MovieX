//
//  NetworkError.swift
//  DataProvider
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation

public enum NetworkError : Error, LocalizedError{
    case invalidURL
    case request(statusCode : Int,data : Data?)
    case badRequest
    case decodeError
    case noInternet
    case noResponse
    case responseConvert
    case noData
}
