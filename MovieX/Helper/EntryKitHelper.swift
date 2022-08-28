//
//  EntryKitHelper.swift
//  MovieX
//
//  Created by Ercan Garip on 27.08.2022.
//

import SwiftEntryKit
import UIComponents
import TinyConstraints

final class EntryKitHelper {
    
    enum EntryKitType {
        case success
        case error
    }
    
    static func show(_ message: String?, type: EntryKitType, statusBar: EKAttributes.StatusBar = .light) {
        var attributes = EKAttributes.bottomFloat
        attributes.displayDuration = 2
        attributes.statusBar = statusBar
        
        let contentView = UIView()
        contentView.layer.cornerRadius = 16
        
        let label: UILabel = {
           let label = UILabel()
            label.font = .medium14
            label.numberOfLines = 0
            label.textColor = .appWhite
            label.textAlignment = .justified
            label.text = message
            return label
        }()
        
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.tintColor = .appWhite
            return imageView
        }()
        
        switch type {
        case .success:
            contentView.backgroundColor = .appGreen
            imageView.image = .icCircleCheck
        case .error:
            contentView.backgroundColor = .red
            imageView.image = .icCancel
        }
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        label.edgesToSuperview(excluding: .leading, insets: .init(top: 16, left: 0, bottom: 16, right: 16))
        
        imageView.size(.init(width: 24, height: 24))
        imageView.centerY(to: label)
        imageView.trailingToLeading(of: label, offset: -8)
        imageView.leadingToSuperview(offset: 16)

        SwiftEntryKit.display(entry: contentView, using: attributes)
    }
}
