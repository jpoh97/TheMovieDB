//
//  Movie.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class Movie {
    
    func getSearchedMovies(httpMoviesRequest : [String : Any]) -> MoviesResponse? {
        let moviesResponse = MoviesResponse(res: httpMoviesRequest)
        return moviesResponse
    }
}

