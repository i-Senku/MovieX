//
//  MovieDetailViewController.swift
//  MovieX
//
//  Created by Ercan Garip on 28.08.2022.
//

import UIKit
import TinyConstraints
import Kingfisher
import UIComponents

final class MovieDetailViewController: BaseViewController<MovieDetailViewModel> {
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleToFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .bold18
        label.textColor = .appWhite
        label.numberOfLines = 0
        return label
    }()
    
    private let actorsLabel: UILabel = {
        let label = UILabel()
        label.font = .medium14
        label.textColor = .appSnow
        label.numberOfLines = 0
        return label
    }()
    
    private let yearLabel: UILabel = {
        let label = UILabel()
        label.font = .medium14
        label.textColor = .appYellow
        label.numberOfLines = 0
        return label
    }()
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        return stackView
    }()
    
    private let imdbButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 16
        return button
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
extension MovieDetailViewController {
    
    private func addSubViews() {
        addPosterImageView()
        addStackView()
        addImdbButton()
    }
    
    private func addPosterImageView() {
        view.addSubview(posterImageView)
        posterImageView.edgesToSuperview(excluding: [.bottom, .trailing], insets: .left(24) + .top(24), usingSafeArea: true)
        posterImageView.width(150)
        posterImageView.height(200)
    }
    
    private func addStackView() {
        view.addSubview(stackView)
        stackView.leadingToTrailing(of: posterImageView, offset: 8)
        stackView.trailingToSuperview(offset: 8)
        stackView.top(to: posterImageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(actorsLabel)
        stackView.addArrangedSubview(yearLabel)
    }
    
    private func addImdbButton() {
        view.addSubview(imdbButton)
        imdbButton.height(48)
        imdbButton.topToBottom(of: posterImageView, offset: 24)
        imdbButton.horizontalToSuperview(insets: .horizontal(24))
    }
}

// MARK: - ConfigureContents
extension MovieDetailViewController {
    
    private func configureContents() {
        title = "Movie Detail"
        imdbButton.addTarget(self, action: #selector(imdbButtonTapped), for: .touchUpInside)
        imdbButton.setTitle("Show in IMDB", for: .normal)
        posterImageView.kf.setImage(with: viewModel.posterImage, placeholder: UIImage.imgDefaultPoster)
        titleLabel.text = viewModel.title
        yearLabel.text = viewModel.year
        actorsLabel.text = viewModel.actors
    }
}

// MARK: - SubscribeViewModel
extension MovieDetailViewController {
    
    private func subscribeViewModel() {
        viewModel.updateScene = { [weak self] in
            guard let self = self else { return }
            self.configureContents()
        }
    }
}

// MARK: - Actions
extension MovieDetailViewController {
    
    @objc
    private func imdbButtonTapped() {
        viewModel.showInImdb()
    }
}
