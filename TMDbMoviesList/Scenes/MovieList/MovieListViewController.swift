//
//  MovieListViewController.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import UIKit

let MOVIE_LIST_CELL = "MovieListCell"

class MovieListViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView?
    
    private var movieList: [Results] = []
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView?.isHidden = true
        viewModel.load()
    }
}

//MARK: DELEGATE
extension MovieListViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showMovieList(let movieList):
            self.movieList = movieList
            tableView?.reloadData()
            tableView?.isHidden = false
        }
    }
    
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
            let viewController = MovieDetailBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
}
//MARK: TABLEVIEW-DELEGATE
extension MovieListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.selectMovie(at: indexPath.row)
    }
}

//MARK: TABLEVIEW-DATASOURCE
extension MovieListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MOVIE_LIST_CELL, for: indexPath) as! MovieListTableViewCell
        let movie = movieList[indexPath.row]
        cell.setupUI(movie: movie)
        return cell
    }
}
