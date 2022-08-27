//
//  SplashViewModel.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation
import DataProvider
import FirebaseRemoteConfig

protocol SplashViewDataSource {
    var routeDelegate: SplashViewRouteDelegate? { get set }
}

protocol SplashViewEventSource {
    var updateTitle: AnyClosure<String?>? { get set }
}

protocol SplashViewRouteDelegate: AnyObject {
    func showHome()
}

protocol SplashViewProtocol: SplashViewDataSource, SplashViewEventSource {
    func viewDidLoad()
}

final class SplashViewModel: BaseViewModel, SplashViewProtocol {
    
    // Privates
    private var remoteConfig: RemoteConfig?
    
    // EventSource
    var updateTitle: AnyClosure<String?>?
    
    // DataSource
    weak var routeDelegate: SplashViewRouteDelegate?
    
    func viewDidLoad() {
        if Connectivity.hasInternetConnection {
            configureRemoteConfig()
        } else {
            updateTitle?("İnternet bağlantısı bulunamadı")
            EntryKitHelper.show("İnternet bağlantınızı kontrol ediniz.", type: .error)
        }
    }
}

// MARK: - Configure
extension SplashViewModel {
    
    private func configureRemoteConfig() {
        remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig?.configSettings = settings
        fetchRemoteConfig()
    }
}

// MARK: - DataProvider
extension SplashViewModel {
    
    private func fetchRemoteConfig() {
        remoteConfig?.fetch { [weak self] (status, error) -> Void in
            guard let self = self else { return }
            if status == .success {
                self.remoteConfig?.activate { changed, error in
                    guard error == nil else {
                        return
                    }
                    let title = self.remoteConfig?.configValue(forKey: "splash_title").stringValue
                    DispatchQueue.main.async {
                        self.updateTitle?(title)
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
                        guard let self = self else { return }
                        self.routeDelegate?.showHome()
                    }
                }
            } else {
                EntryKitHelper.show(error?.localizedDescription, type: .success)
            }
        }
    }
}
