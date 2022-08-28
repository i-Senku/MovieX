//
//  MovieCell.swift
//  UIComponents
//
//  Created by Ercan Garip on 27.08.2022.
//

import UIKit
import TinyConstraints
import Kingfisher

public class MovieCell: UICollectionViewCell, ReusableView {
    
    weak var viewModel: MovieCellProtocol?
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .regular16
        label.textColor = .appSnow
        label.numberOfLines = 2
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        configureContents()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureContents()
    }
    
    public func set(viewModel: MovieCellProtocol) {
        self.viewModel = viewModel
        configureContents()
    }
}

// MARK: - UILayout
extension MovieCell {
    
    private func addSubViews() {
        addPosterImageView()
        addTitleLabel()
    }
    
    private func addPosterImageView() {
        contentView.addSubview(posterImageView)
        posterImageView.edgesToSuperview(excluding: .bottom)
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.edgesToSuperview(excluding: [.top])
        titleLabel.topToBottom(of: posterImageView, offset: 8)
    }
}

extension MovieCell {
    
    private func configureContents() {
        guard let viewModel = viewModel else { return }
        posterImageView.kf.setImage(with: viewModel.poster?.supportedUrl, placeholder: UIImage.imgDefaultPoster)
        titleLabel.text = viewModel.title
    }
}
