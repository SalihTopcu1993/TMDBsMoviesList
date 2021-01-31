//
//  MovieListTableViewCell.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 31.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet private weak var titleLabel: UILabel?
    @IBOutlet private weak var ratingLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupUI(movie: Results){
        titleLabel?.text = movie.name
        ratingLabel?.text = String(movie.voteAverage ?? 0.0)
    }
}
