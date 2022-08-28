//
//  MovieCellModel+Extension.swift
//  MovieX
//
//  Created by Ercan Garip on 28.08.2022.
//

import Foundation
import UIComponents
import DataProvider

extension MovieCellModel {
    
    convenience init(movie: Movie) {
        self.init(poster: movie.poster,
                  title: movie.title)
    }
}
