//
//  MovieDetailViewController.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import UIKit
import Kingfisher

class MovieDetailViewController: UIViewController {

    @IBOutlet private weak var movieImgView: UIImageView?
    @IBOutlet private weak var posterImgView: UIImageView?
    @IBOutlet private weak var overviewLabel: UILabel?
    
    var viewModel: MovieDetailViewModelProtocol!
    
    //MARK: LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
}

//MARK: DELEGATE
extension MovieDetailViewController: MovieDetailViewModelDelegate {
    func showDetail(_ presentation: MovieDetailPresentation) {
        self.title = presentation.title
        movieImgView?.kf.setImage(with: URL(string: presentation.imageURL))
        posterImgView?.kf.setImage(with: URL(string: presentation.posterImageURL))
        overviewLabel?.text = presentation.overview
    }
}
