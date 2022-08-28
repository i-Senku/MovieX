//
//  HomeViewModel.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation
import DataProvider
import UIComponents

protocol HomeViewDataSource {
    var movieRepository: MovieRepositoryProtocol { get set }
    var numberOfItems: Int { get }
    
    func cellForItemAt(indexPath: IndexPath) -> MovieCellProtocol
}

protocol HomeViewEventSource {
    var reloadData: AnyClosure<String?>? { get set }
}

protocol HomeViewProtocol: HomeViewDataSource, HomeViewEventSource {
    func viewDidLoad()
    func search(text: String)
    func startPagination()
    func didSelect(indexPath: IndexPath)
}

protocol HomeViewRouteDelegate: AnyObject {
    func showDetail(movie: Movie)
}

final class HomeViewModel: BaseViewModel, HomeViewProtocol {
    
    // Privates
    private var cellItems: [MovieCellProtocol] = []
    private var movieItems: [Movie] = []
    private var searchTimer: Timer?
    private var page: Int = 1
    private var text: String = ""
    private var searchable = false
    
    // EventSource
    var reloadData: AnyClosure<String?>?
    
    // DataSource
    var movieRepository: MovieRepositoryProtocol
    weak var routeDelegate: HomeViewRouteDelegate?
    
    public init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }
    
    func viewDidLoad() {
        reloadData?("You can search movies")
    }
    
    func didSelect(indexPath: IndexPath) {
        let movie = movieItems[indexPath.row]
        routeDelegate?.showDetail(movie: movie)
    }
}

// MARK: - DataSource
extension HomeViewModel {
    
    var numberOfItems: Int {
        return cellItems.count
    }
    
    func cellForItemAt(indexPath: IndexPath) -> MovieCellProtocol {
        return cellItems[indexPath.row]
    }
}

// MARK: - DataProvider
extension HomeViewModel {
    
    func search(text: String) {
        self.text = text
        self.page = 1
        self.searchable = false
        searchTimer?.invalidate()
        if !text.isEmpty {
            searchTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: { _ in
                self.showLoading?()
                self.movieRepository.search(text: text, page: self.page) { [weak self] result in
                    guard let self = self else { return }
                    self.hideLoading?()
                    switch result {
                    case .success(let searchResponse):
                        self.cellItems = searchResponse.movieList?.map { MovieCellModel(movie: $0) } ?? []
                        self.movieItems = searchResponse.movieList ?? []
                        self.searchable = self.cellItems.count < searchResponse.totalCount
                        self.reloadData?(nil)
                    case .failure(let error):
                        self.cellItems.removeAll()
                        self.reloadData?(error.message)
                        EntryKitHelper.show(error.message, type: .error)
                    }
                }
            })
        } else {
            self.cellItems.removeAll()
            reloadData?("You can search movies")
        }
    }
    
    func startPagination() {
        if searchable {
            searchable = false
            page += 1
            showLoading?()
            movieRepository.search(text: text, page: page) { [weak self] result in
                guard let self = self else { return }
                self.hideLoading?()
                switch result {
                case .success(let searchResponse):
                    let movieList = searchResponse.movieList?.map { MovieCellModel(movie: $0) } ?? []
                    self.movieItems.append(contentsOf: searchResponse.movieList ?? [])
                    self.cellItems.append(contentsOf: movieList)
                    self.searchable = self.cellItems.count < searchResponse.totalCount
                    self.reloadData?(nil)
                case .failure(let error):
                    self.searchable = false
                    EntryKitHelper.show(error.message, type: .error)
                }
            }
        }
    }
}
