//
//  Connectivity.swift
//  DataProvider
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation
import Alamofire

public struct Connectivity {
    
    public static let shared = NetworkReachabilityManager()
    public static var hasInternetConnection: Bool {
        return self.shared?.isReachable ?? false
    }
}
