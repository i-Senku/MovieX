//
//  BaseViewController.swift
//  MovieX
//
//  Created by Ercan Garip on 24.08.2022.
//

import Foundation
import UIKit
import UIComponents

class BaseViewController<V: BaseViewModelProtocol>: UIViewController {
    
    var viewModel: V
    
    init(viewModel: V) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // swiftlint:enable fatal_error unavailable_function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContents()
        subscribeLoading()
    }
    
    private func configureContents() {
        self.tabBarController?.tabBar.isTranslucent = true
        view.backgroundColor = .appDark
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.appWhite]
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
#if DEBUG
    deinit {
        debugPrint("deinit \(self)")
    }
#endif
}

// MARK: - Loading
extension BaseViewController {
    
    private func subscribeLoading() {
        viewModel.showLoading = { [weak self] in
            guard let self = self else { return }
            let loadingView = MovieXLoadingView()
            loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            loadingView.frame = self.view.bounds
            self.view.addSubview(loadingView)
        }
        
        viewModel.hideLoading = { [weak self] in
            guard let self = self else { return }
            self.view.subviews.filter({ $0 is MovieXLoadingView }).forEach({ $0.removeFromSuperview() })
        }
    }
}

