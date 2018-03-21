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
    
    init?(page : Int?, totalPages : Int?, movies : [[String: Any]]) {
        self.page = page ?? 0
        self.totalPages = totalPages ?? 0
        self.movies = movies.map { MovieData($0)! }
    }
    
    convenience init?(res : [String : Any]) {
        let page = res["page"] as? Int
        let totalPages = res["total_pages"] as? Int
        let resMovies = res["results"] as? [[String: Any]]
        self.init(page: page, totalPages: totalPages, movies: resMovies ?? [[:]])
    }
}
