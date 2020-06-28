//
//  ApiTopRatedMoviesRequest.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation


struct ApiTopRatedMoviesRequest: ApiRequest {
    var urlRequest: URLRequest {
        let url: URL! = URL(string: AppUrl.TopRatedMovies)
        var request = URLRequest(url: url)
            request.httpMethod = "GET"
        return request
    }
}
