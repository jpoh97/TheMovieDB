//
//  MovieProtocol.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/14/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol MovieProtocol {
    var title : String { get set }
    var id : Int { get set }
    var voteAverage : Double { get set }
    var overview : String { get set }
    var posterPath : String { get set }
}
