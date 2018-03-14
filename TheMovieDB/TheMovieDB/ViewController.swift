//
//  ViewController.swift
//  TheMovieDB
//
//  Created by Jaime Laino on 1/24/17.
//  Copyright © 2017 Globant. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchMovieTextField: UITextField!
    @IBOutlet weak var responseSearchMovieLabel: UILabel!
    
    var page = 1
    var responseSearchMovie = ""
    var movies : MoviesResponse?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchMovieAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getSearchedMovies(query: searchMovieTextField.text!.isEmpty ? "Nemo" : searchMovieTextField.text!, page: page, completion: {[weak self] moviesResponse in
            self?.movies = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
    @IBAction func getNowPlayingAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.nowPlaying, completion: {[weak self] moviesResponse in
            self?.movies = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
    @IBAction func getPopularAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.popular, completion: {[weak self] moviesResponse in
            self?.movies = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
    @IBAction func getTopRatedAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.topRated, completion: {[weak self] moviesResponse in
            self?.movies = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
}

