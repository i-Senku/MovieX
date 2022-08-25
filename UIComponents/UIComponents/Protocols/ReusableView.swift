//
//  ReusableView.swift
//  UIComponents
//
//  Created by Ercan Garip on 25.08.2022.
//

import Foundation
import UIKit

public protocol ReusableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
