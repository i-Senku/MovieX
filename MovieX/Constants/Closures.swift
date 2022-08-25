//
//  Closures.swift
//  MovieX
//
//  Created by Ercan Garip on 25.08.2022.
//

import Foundation

typealias VoidClosure = (() -> Void)
typealias StringClosure = ((String) -> Void)
typealias IntClosure = ((Int) -> Void)
typealias DoubleClosure = ((Double) -> Void)
typealias AnyClosure<T: Any> = ((T) -> Void)
typealias BoolClosure = ((Bool) -> Void)
