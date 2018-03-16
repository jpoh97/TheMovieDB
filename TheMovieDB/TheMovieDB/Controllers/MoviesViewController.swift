//
//  MoviesViewController.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController, ListDelegate, UISearchBarDelegate {

    @IBOutlet weak var searchMoviesBar: UISearchBar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var switchButton: UIBarButtonItem!
    
    var page = 1
    var moviesResponse : MoviesResponse?
    var listOfMovies : List!
    var isTableViewActive = true
    var selectedSegmentIndex = 0
    var categoryOfMovies = TypeOfLists.topRated

    override func viewDidLoad() {
        super.viewDidLoad()
        configureListOfMovies()
        containerView.autoresizesSubviews = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        print("end searching --> Close Keyboard")
        self.searchMoviesBar.endEditing(true)
    }
    
    @IBAction func getMoviesAction(_ sender: UISegmentedControl) {
        selectedSegmentIndex = segmentedControl.selectedSegmentIndex
        switch selectedSegmentIndex {
        case 0:
            getTopRated()
            categoryOfMovies = TypeOfLists.topRated
        case 1:
            getPopular()
            categoryOfMovies = TypeOfLists.popular
        case 2:
            getNowPlaying()
            categoryOfMovies = TypeOfLists.nowPlaying
        case 3:
            getUpcoming()
            categoryOfMovies = TypeOfLists.upcoming
        default:
            fatalError("Error en el segmented control")
        }
    }
    
    @IBAction func switchTableCollection(_ sender: UIBarButtonItem) {
        (listOfMovies as! UIView).removeFromSuperview()
        if(isTableViewActive) {
            switchButton.title = "table"
        } else {
            switchButton.title = "collection"
        }
        isTableViewActive = !isTableViewActive
        changeTypeOfList()
    }
    
    func numberOfCells() -> Int {
        return moviesResponse!.movies!.count
    }
    
    func configureCell(cell: ListCell, index: Int) {
        cell.title.text = moviesResponse?.movies![index].title
        if(isTableViewActive) {
            cell.overview.text = moviesResponse?.movies![index].overview ?? ""
        }
        // Configure image
        guard let url = try? "https://image.tmdb.org/t/p/w154\(moviesResponse!.movies![index].posterPath)".asURL() else {
            fatalError("Error en la ruta de la imagen")
        }
        cell.imageMovie.af_setImage(withURL: url)
    }
    
    
    
    func searchMovie() {
        MovieFacade.getSearchedMovies(query: searchMoviesBar.text!.isEmpty ? "Nemo" : searchMoviesBar.text!, page: page, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.updateListOfMovies()
        })
    }
    func getNowPlaying() {
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.nowPlaying, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.updateListOfMovies()
        })
    }
    
    func getPopular() {
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.popular, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.updateListOfMovies()
        })
    }
    
    func getTopRated() {
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.topRated, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.updateListOfMovies()
        })
    }
    
    func getUpcoming() {
        MovieFacade.getList(page: page, typeOfList: TypeOfLists.upcoming, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.updateListOfMovies()
        })
    }
    
    func updateListOfMovies() {
        listOfMovies.reloadAllData()
    }
    
    func configureListOfMovies() {
        MovieFacade.getList(page: page, typeOfList: categoryOfMovies, completion: {[weak self] moviesResponse in
            self?.moviesResponse = moviesResponse
            self?.changeTypeOfList()
        })
    }
    
    func changeTypeOfList() {
        // Configuro la lista dependiendo de si va a ser tabla o colección
        if(isTableViewActive) {
            listOfMovies = ListTableView(frame: CGRect(x: 0, y: 0, width: (containerView.bounds.width), height: (containerView.bounds.height)))
        } else {
            listOfMovies = ListCollectionView(frame: CGRect(x: 0, y: 0, width: (containerView.bounds.width), height: (containerView.bounds.height)))
        }
        listOfMovies.listDelegate = self
        listOfMovies.reloadAllData()
        // Inserto la lista a la vista dependiendo de si va a ser tabla o colección
        if(isTableViewActive) {
            containerView.addSubview(listOfMovies as! UITableView)
        } else {
            containerView.addSubview(listOfMovies as! UICollectionView)
        }
        // Agrego constraints a la vista agregada
        addConstraintsToListOfMovies()
    }
    
    func addConstraintsToListOfMovies() {
        if let listOfMoviesAsView = listOfMovies as? UIView {
            listOfMoviesAsView.autoresizesSubviews = true
            listOfMoviesAsView.translatesAutoresizingMaskIntoConstraints = false
            listOfMoviesAsView.leftAnchor.constraint(equalTo: (containerView.leftAnchor), constant: 0).isActive = true
            listOfMoviesAsView.rightAnchor.constraint(equalTo: (containerView.rightAnchor), constant: 0).isActive = true
            listOfMoviesAsView.topAnchor.constraint(equalTo: (containerView.topAnchor), constant: 0).isActive = true
            listOfMoviesAsView.bottomAnchor.constraint(equalTo: (containerView.bottomAnchor), constant: 0).isActive = true
        }
    }
    
    override func viewLayoutMarginsDidChange() {
        if(!isTableViewActive) {
            updateListOfMovies()
        }
    }
    
}
