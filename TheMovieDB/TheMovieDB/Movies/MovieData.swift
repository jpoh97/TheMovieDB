//
//  MovieData.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MovieData : MovieProtocol {
    var title : String
    var id : Int
    var voteAverage : Double
    var overview : String
    var posterPath : String
    
    init?(id : Int, title : String, voteAverage : Double, overview : String, posterPath : String) {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.posterPath = posterPath        
    }
}

