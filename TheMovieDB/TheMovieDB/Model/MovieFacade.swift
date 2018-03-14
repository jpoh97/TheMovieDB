//
//  Movie.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MovieFacade {
    
    private static var httpMoviesRequest = HttpMoviesRequest()
    
    static func getSearchedMovies(query : String, page : Int, completion : @escaping (MoviesResponse) -> ()) {
        httpMoviesRequest.searchMovies(query: query, page: page, completion: {httpMoviesRequest in
            completion(MoviesResponse(res: httpMoviesRequest)!)
        })

    }
    
    static func getList(page : Int, typeOfList : TypeOfLists, completion : @escaping (MoviesResponse) -> ()) {
        MovieRouter.typeOfList = typeOfList
        httpMoviesRequest.getList(page: page, completion: {httpMoviesRequest in
            completion(MoviesResponse(res: httpMoviesRequest)!)
        })
    }
}

