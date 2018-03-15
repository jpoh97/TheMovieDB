//
//  UIListDelegate.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

protocol ListDelegate : class {
    func numberOfCells() -> Int
    func configureCell(cell: ListCell, index: Int)
}

