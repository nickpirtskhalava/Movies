//
//  AppConsts.swift
//  Movies
//
//  Created by Nikoloz Phirtskhalava on 6/28/20.
//  Copyright © 2020 Nikoloz Phirtskhalava. All rights reserved.
//

import UIKit

// MARK: enums

enum FavoriteState: String {
    case canAdd = "Add To Favorites"
    case added  = "Movie added"
}

extension FavoriteState {
    var color: UIColor {
        switch self {
        case .canAdd:
            return #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        case .added:
            return #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        }
    }
}

enum MovieCategory: Int {
    case popular = 0
    case topRated 
    case favorite
}

extension MovieCategory {
    var request: ApiRequest {
        switch self {
        case .popular:
            return ApiPopularMoviesRequest()
        default:
            return ApiTopRatedMoviesRequest()
        }
    }
}

// MARK: Constants

struct AppConsts {

    struct Filter {
        static let title = "Filter"
        static let message = ""
    }
    
    struct AlertAction {
        static let popular = "Popular"
        static let topRated = "Top Rated"
        static let favorite = "Favorite"
        static let cancel = "Cancel"
    }
    
    struct Favorite {
        struct State {
            static let canAdd = "Add To Favorites"
            static let added = "Movie added"
        }
    }
    
    struct UI {
        struct StoryBoard {
            static let main = "Main"
            
            struct Id {
                static let movieDetails = "MovieDetailsController"
                static let filter = "FilterController"
            }
        }
        
        struct Cell {
            struct MovieCollection {
                static let id = "MovieCollectionCell"
            }
        }
    }
}


