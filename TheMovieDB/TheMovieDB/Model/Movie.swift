//
//  Movie.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class Movie {
    
    static func getSearchedMovies(query : String, apiKey : String, page : Int, completion : @escaping (MoviesResponse) -> ()) {
        let httpMoviesRequest = HttpMoviesRequest()
        httpMoviesRequest.searchMovies(query: query, apiKey: apiKey, page: page, completion: {httpMoviesRequest in
            completion(MoviesResponse(res: httpMoviesRequest)!)
        })
    }
}

