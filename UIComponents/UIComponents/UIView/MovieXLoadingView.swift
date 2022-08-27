//
//  MovieXLoadingView.swift
//  UIComponents
//
//  Created by Ercan Garip on 27.08.2022.
//

import Foundation
import UIKit
import Lottie
import TinyConstraints

public class MovieXLoadingView: UIView {
    
    private var animationView: AnimationView = AnimationView(name: "loading")
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    // swiftlint:disable fatal_error unavailable_function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UI Layout
extension MovieXLoadingView {
    
    private func addSubViews() {
        addAnimationView()
    }
    
    private func addAnimationView() {
        addSubview(animationView)
        animationView.centerInSuperview()
        animationView.size(.init(width: 200, height: 200))
    }
}

// MARK: - Configure
extension MovieXLoadingView {
    
    private func configureContents() {
        backgroundColor = .appDark.withAlphaComponent(0.25)
        configureAnimationView()
    }
    
    private func configureAnimationView() {
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.animationSpeed = 0.75
        animationView.backgroundBehavior = .pauseAndRestore
        animationView.play()
    }
}

public extension UIWindow {
    
    func showLoadingMovieX() {
        guard !subviews.contains(where: { $0 is MovieXLoadingView }) else { return }
        
        let loadingView = MovieXLoadingView()
        loadingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        loadingView.frame = bounds
        
        UIView.transition(
            with: self,
            duration: 0,
            options: .transitionCrossDissolve,
            animations: {
                self.addSubview(loadingView)
            }
        )
    }
    
    func hideLoadingMovieX() {
        subviews.filter({ $0 is MovieXLoadingView }).forEach({ $0.removeFromSuperview() })
    }
}
