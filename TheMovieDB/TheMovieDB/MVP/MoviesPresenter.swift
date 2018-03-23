
//
//  File.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/22/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

protocol MoviesView : class {
    func updateListOfMovies()
    func changeTypeOfList()
}

final class MoviesPresenter {
    private var service : MoviesService.Type
    unowned fileprivate var view : MoviesView
    var moviesResponse : MoviesResponse?
    fileprivate var page = 1
    var isTableViewActive = true {
        didSet {
            view.changeTypeOfList()
        }
    }
    
    var listTitle : String {
        return isTableViewActive ? "table" : "collection"
    }
    
    var selectedSegmentIndex = 0 {
        didSet {
            switchMovieType()
        }
    }
    
    fileprivate var categoryOfMovies = TypeOfLists.topRated{
        didSet {
            getList()
        }
    }
    
    init(view : MoviesView, service : MoviesService.Type) {
        self.view = view
        self.service = service
    }
    
    func searchMovie() {
        //searchMoviesBar.text!.isEmpty ? "Nemo" : searchMoviesBar.text!
        service.getSearchedMovies(query: "Nemo", page: page, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.view.updateListOfMovies()
        })
    }
    
    func getList() {
        service.getList(page: page, typeOfList: categoryOfMovies, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.view.changeTypeOfList()
            self?.view.updateListOfMovies()
        })
    }
    
    func switchMovieType() {
        switch selectedSegmentIndex {
        case 0:
            categoryOfMovies = TypeOfLists.topRated
        case 1:
            categoryOfMovies = TypeOfLists.popular
        case 2:
            categoryOfMovies = TypeOfLists.nowPlaying
        case 3:
            categoryOfMovies = TypeOfLists.upcoming
        default:
            fatalError("Error en el segmented control")
        }
    }
    
    
    
}
