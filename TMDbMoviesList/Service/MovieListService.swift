//
//  MovieListService.swift
//  TMDbMoviesList
//
//  Created by Salih Topcu on 30.01.2021.
//  Copyright © 2021 Salih Topcu. All rights reserved.
//

import Foundation
import Moya


enum TMDbMovieListService {
    case popular(page: Int)
}

let pluginsArray:[PluginType] = [NetworkLoggerPlugin(cURL: true)]
let provider = MoyaProvider<TMDbMovieListService>(plugins: pluginsArray)

extension TMDbMovieListService: TargetType {

    var baseURL: URL {
        return URL(string: Constants.shared.BASE_URL)!
    }


    var path: String {
        switch self {
        case .popular:
            return Constants.shared.POPULAR
        }
    }

    var method: Moya.Method {
        switch self {
        case .popular:
            return .get
        }
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        var params = [String: Any]()
        params["api_key"] = Constants.shared.API_KEY

        switch self {
        case .popular(page: let page):
            params["page"] = page
            return .requestParameters(parameters: params, encoding: URLEncoding.default)
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }

    var headers: [String : String]? {
        return nil
    }
}

