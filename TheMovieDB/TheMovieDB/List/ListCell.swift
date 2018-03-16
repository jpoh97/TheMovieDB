//
//  UIListCell.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol ListCell : class {
    var title : UILabel! { get set }
    var overview : UILabel! { get set }
    var imageMovie : UIImageView! { get set }
}
