//
//  UITableViewCell.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class ListTableViewCell : UITableViewCell, ListCell {
    
    @IBOutlet weak var title : UILabel!
    @IBOutlet weak var overview : UILabel!
    @IBOutlet weak var imageMovie : UIImageView!
  
}

