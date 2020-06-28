//
//  ApiPopularMoviesRequest.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation


struct ApiPopularMoviesRequest: ApiRequest {
    var urlRequest: URLRequest {
        let url: URL! = URL(string: AppUrl.PopulaMovies)
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
        return request
    }
}
