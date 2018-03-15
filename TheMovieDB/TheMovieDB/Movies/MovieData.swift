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
    var poster : UIImage
    
    init?(id : Int, title : String, voteAverage : Double, overview : String) {
        self.id = id
        self.title = title
        self.voteAverage = voteAverage
        self.overview = overview
        self.poster = UIImage()
    }
}

