//
//  HomeViewModel.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation

protocol HomeViewDataSource {}

protocol HomeViewEventSource {}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    
}
