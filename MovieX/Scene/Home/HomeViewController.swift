//
//  HomeViewController.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import UIKit
import TinyConstraints
import UIComponents
import DataProvider

final class HomeViewController: BaseViewController<HomeViewModel> {
    
    private lazy var searchBar: UISearchBar = {
        let searchbar = UISearchBar()
        searchbar.searchTextField.textColor = .appWhite
        searchbar.searchTextField.leftView?.tintColor = .appWhite
        searchbar.delegate = self
        return searchbar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        configureContents()
        subscribeViewModel()
        viewModel.viewDidLoad()
    }
}

// MARK: - UILayout
extension HomeViewController {
    
    private func addSubViews() {
        addSearchBar()
        addCollectionView()
    }
    
    private func addSearchBar() {
        view.addSubview(searchBar)
        searchBar.height(40)
        searchBar.topToSuperview(usingSafeArea: true)
        searchBar.horizontalToSuperview()
    }
    
    private func addCollectionView() {
        view.addSubview(collectionView)
        collectionView.edgesToSuperview(excluding: .top, usingSafeArea: true)
        collectionView.topToBottom(of: searchBar, offset: 16)
    }
}

// MARK: - ConfigureContents
extension HomeViewController {
    
    private func configureContents() {
        title = "Movies"
        searchBar.placeholder = "Search"
        searchBar.backgroundImage = UIImage()
    }
}

// MARK: - SubscribeViewModel
extension HomeViewController {
    
    private func subscribeViewModel() {
        viewModel.reloadData = { [weak self] text in
            guard let self = self else { return }
            if let text = text {
                self.collectionView.info(message: text)
            } else {
                self.collectionView.restore()
            }
            self.collectionView.reloadData()
        }
    }
}

// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(text: searchText)
    }
}

// MARK: - UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelect(indexPath: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (collectionView.contentSize.height - 150) - scrollView.frame.size.height {
            viewModel.startPagination()
        }
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: MovieCell = collectionView.dequeueReusableCell(for: indexPath)
        cell.set(viewModel: viewModel.cellForItemAt(indexPath: indexPath))
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 24) / 2
        return .init(width: width, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .horizontal(8)
    }
}

// MARK: - HomeViewC
extension HomeViewController: HomeViewRouteDelegate {
    
    func showDetail(movie: Movie) {
        let viewController = MovieDetailRouter.create(movie: movie)
        navigationController?.pushViewController(viewController, animated: true)
    }
}
