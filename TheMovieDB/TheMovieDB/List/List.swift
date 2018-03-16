//
//  UIList.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol List : class {
    weak var listDelegate : ListDelegate? { get set }
    
    func reloadAllData()
}
