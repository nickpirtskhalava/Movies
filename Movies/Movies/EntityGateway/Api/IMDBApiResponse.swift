//
//  IMDBApiResponse.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

struct IMDBApiResponse<T: Decodable>: Decodable {
    let page: Int
    let total_results: Int
    let total_pages: Int
    let results: T
}
