//
//  MovieListViewModel.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import Foundation

final class MovieListViewModel: MovieListViewModelProtocol {
    
    weak var delegate: MovieListViewModelDelegate?

    private var movies: [Results] = []
    
    //MARK: DATA
    func load() {
        
        notify(.updateTitle("Movies"))
        notify(.setLoading(true))
        
        provider.request(.popular(page: 1 )) { (response) in
            switch response {
            case .failure(let err):
                print(err)
            case .success(let value):
                let data = value.data
                do {
                    let result = try JSONDecoder().decode(Movie.self, from: data)
                    self.movies = result.results ?? []
                    self.notify(.showMovieList(self.movies))
                    print(result)
                } catch let error {
                    print(error)
                }
            }
        }
    }
    
    func selectMovie(at index: Int) {
        let movie = movies[index]
        let viewModel = MovieDetailViewModel(presentation: MovieDetailPresentation(title: movie.name ?? "", posterImageURL: movie.posterImageUrl() ?? "", imageURL: movie.backDropImageUrl() ?? "", overview: movie.overview ?? "", artistName: movie.name ?? ""))
        delegate?.navigate(to: .detail(viewModel))
    }
    
    private func notify(_ output: MovieListViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
