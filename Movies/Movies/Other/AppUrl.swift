//
//  AppUrl.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import Foundation

struct AppUrl {
    
    private struct Domains {
        static let prod = "https://api.themoviedb.org"
        static let image = "https://image.tmdb.org"
    }
    
    private  struct Routes {
        static let api = "/3/movie"
    }
    
    private struct Api {
        static let key = "c18dc319c2ed176fc6c25a7185c6b8ec"
    }
    
    private struct Method {
        static let topRated = "/top_rated"
    }
    
    public struct Param {
        
        struct Key {
            static let apiKey = "?api_key="
            static let language = "&language="
            static let page = "&page="
        }
        
        struct Value {
            static let language = "en-US"
            static let page = "1"
        }
    }
    
    private static let BaseUrl = Domains.prod
    public  static let ImagePath = Domains.image + "/t/p/original"
    
    static var PopulaMovies: String {
        return BaseUrl + Routes.api + Method.topRated + Param.Key.apiKey + Api.key + Param.Key.language + Param.Value.language + Param.Key.page + Param.Value.page
    }
}
