//
//  MoviesViewController.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController, ListDelegate {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var searchMoviesBar: UISearchBar!
    @IBOutlet weak var responseSearchMovieLabel: UILabel!
    
    var page = 1
    var responseSearchMovie = ""
    var moviesResponse : MoviesResponse?
    var listOfMovies : List!

    override func viewDidLoad() {
        super.viewDidLoad()
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.nowPlaying, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
            self?.listOfMovies = ListTableView(frame: CGRect(x: 8, y: 200, width: 400, height: 400 ))
            self?.listOfMovies.listDelegate = self
            self?.listOfMovies.reloadAllData()
            self?.view.addSubview(self?.listOfMovies as! UITableView)
            self?.view.reloadInputViews()
//            self?.containerView.addSubview(self?.listOfMovies as! UITableView)
        })
        
        
        
//        let searchButton = UIBarButtonItem(title: "Nombre", style: .done, target: self, action: nil)
//        self.navigationItem.rightBarButtonItem = searchButton
        // Do any additional setup after loading the view.
    }
    
    func numberOfCells() -> Int {
//        print(" ..... \(moviesResponse!.movies!.count)")
        return moviesResponse!.movies!.count
    }
    
    func configureCell(cell: ListCell, index: Int) {
        let title = UILabel(frame: CGRect(x: 0, y: 0, width: 250, height: 30))
        title.text = moviesResponse?.movies![index].title
        
        cell.title = title
        (cell as? UITableViewCell)?.sizeToFit()
        (cell as? UITableViewCell)?.addSubview(title)
        
        let overview = UILabel(frame: CGRect(x: 250, y: 0, width: 250, height: 30))
        overview.text = moviesResponse?.movies![index].overview
        cell.overview = overview
        (cell as? UITableViewCell)?.sizeToFit()
        (cell as? UITableViewCell)?.addSubview(overview)

        
        print(cell.title)

//        cell.image = ??
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchMovieAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getSearchedMovies(query: searchMoviesBar.text!.isEmpty ? "Nemo" : searchMoviesBar.text!, page: page, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
    @IBAction func getNowPlayingAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.nowPlaying, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
    @IBAction func getPopularAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.popular, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
    @IBAction func getTopRatedAction(_ sender: UIButton) {
        responseSearchMovie = ""
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.topRated, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            for movie in moviesResponse.movies! {
                self?.responseSearchMovie += movie.title + "\n"
            }
            self?.responseSearchMovieLabel.text = self?.responseSearchMovie
        })
    }
    
}
