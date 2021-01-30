//
//  Movie.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import Foundation

struct Movie : Codable {
    
    let page : Int?
    let results : [Results]?
    let totalPages : Int?
    let totalResults : Int?
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        totalResults = try values.decodeIfPresent(Int.self, forKey: .totalResults)
    }
}

struct Results : Codable {
    
    let backdropPath : String?
    let overview : String?
    let posterPath : String?
    let title : String?
    let voteAverage : Float?
    let name: String?
        
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case overview = "overview"
        case posterPath = "poster_path"
        case title = "title"
        case voteAverage = "vote_average"
        case name = "name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        voteAverage = try values.decodeIfPresent(Float.self, forKey: .voteAverage)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
    
    func posterImageUrl() -> String? {
        if let posterPath = posterPath {
            return "\(Constants.shared.IMAGES_BASE_URL)\(posterPath)"
        }
        return nil
    }
    
    func backDropImageUrl() -> String? {
        if let backdropPath = backdropPath {
            return "\(Constants.shared.BACK_DROP_BASE_URL)\(backdropPath)"
        }
        return nil
    }
}

