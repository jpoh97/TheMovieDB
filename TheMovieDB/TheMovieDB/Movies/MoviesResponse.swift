//
//  MoviesResponse.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import Foundation

class MoviesResponse {
    var movies : [MovieProtocol]?
    var page : Int?
    var totalPages : Int?
    
    init?(res : [String : Any]){
        guard let page = res["page"] as? Int,
            let totalPages = res["total_pages"] as? Int,
            let resMovies = res["results"] as? [[String: Any]] else {
                return nil
        }
        self.page = page
        self.totalPages = totalPages
        self.movies = [MovieProtocol]()
        for movie in resMovies {
            guard let resMovie = MovieData(
                id: movie["id"] as! Int,
                title : movie["title"] as! String,
                voteAverage : movie["vote_average"] as! Double,
                overview : movie["overview"] as! String,
                posterPath : movie["poster_path"] as! String) else {
                fatalError("La pelicula esta incompleta")
            }
            self.movies!.append(resMovie)
        }
    } // Convenience init
}
