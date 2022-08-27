//
//  SplashViewModel.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation

protocol SplashViewDataSource {}

protocol SplashViewEventSource {}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {}

final class SplashViewModel: BaseViewModel, SplashViewProtocol {
    
}
