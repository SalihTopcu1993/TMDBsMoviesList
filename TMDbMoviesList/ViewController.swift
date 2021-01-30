//
//  ViewController.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var viewModel: MovieListViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel?.delegate = self
        viewModel?.load()
    }
}

extension ViewController: MovieListViewModelDelegate {
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        print("")
    }
    
    func navigate(to route: MovieListViewRoute) {
        print("")
    }
    
    
}

