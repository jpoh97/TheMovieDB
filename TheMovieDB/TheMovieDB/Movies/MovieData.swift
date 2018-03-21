//
//  MovieData.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MovieData : MovieProtocol {
    var title : String?
    var id : Int?
    var voteAverage : Double?
    var overview : String?
    var posterPath : String?
    
    init?(id : Int?, title : String?, voteAverage : Double?, overview : String?, posterPath : String?) {
        self.id = id ?? 0
        self.title = title ?? ""
        self.voteAverage = voteAverage ?? 0.0
        self.overview = overview ?? ""
        self.posterPath = posterPath ?? ""
    }
    
    convenience init?(_ jsonResponseMovie: [String : Any]?) {
        self.init(
            id: jsonResponseMovie?["id"] as? Int,
            title: jsonResponseMovie?["title"] as? String,
            voteAverage: jsonResponseMovie?["vote_average"] as? Double,
            overview: jsonResponseMovie?["overview"] as? String,
            posterPath: jsonResponseMovie?["poster_path"] as? String)
    }
}

extension MovieData : Equatable {
    static func ==(movie1: MovieData, movie2: MovieData) -> Bool {
        return (movie1.id == movie2.id
            && movie1.overview == movie2.overview
            && movie1.posterPath == movie2.posterPath
            && movie1.title == movie2.posterPath
            && movie1.voteAverage == movie2.voteAverage)
    }
}

