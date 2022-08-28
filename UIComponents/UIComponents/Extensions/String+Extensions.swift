//
//  String+Extensions.swift
//  UIComponents
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation

public extension String {
    
    var supportedUrl: URL? {
        let string = self.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed)
        if let string = string {
            return URL(string: string)
        } else {
            return nil
        }
    }
}
