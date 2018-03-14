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
    
    var querySearchString = ""
    var movies : Movie = Movie()
    var apiKey = "1f4d7de5836b788bdfd897c3e0d0a24b"
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchMovieAction(_ sender: UIButton) {
        let httpMoviesRequest = HttpMoviesRequest()
        httpMoviesRequest.searchMovies(query: searchMovieTextField.text!, apiKey: apiKey, page: page, completion: {moviesResponse in
            for movie in moviesResponse.movies! {
                print(movie.title)
            }
        })
    }
    

}

