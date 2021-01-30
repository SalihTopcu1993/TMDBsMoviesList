//
//  MovieDetailContracts.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import Foundation

protocol MovieDetailViewModelDelegate: class {
    func showDetail(_ presentation: MovieDetailPresentation)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
