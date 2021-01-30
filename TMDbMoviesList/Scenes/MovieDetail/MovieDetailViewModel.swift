//
//  MovieDetailViewModel.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import Foundation

final class MovieDetailViewModel: MovieDetailViewModelProtocol {
    
    weak var delegate: MovieDetailViewModelDelegate?
    private let presentation: MovieDetailPresentation
    
    init(presentation: MovieDetailPresentation) {
        self.presentation = presentation
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
}
