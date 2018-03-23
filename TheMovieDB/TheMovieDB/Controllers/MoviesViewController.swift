//
//  MoviesViewController.swift
//  TheMovieDB
//
//  Created by Juan Pablo Ospina Herrera on 3/15/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import UIKit
import AlamofireImage

class MoviesViewController: UIViewController {

    @IBOutlet weak var searchMoviesBar: UISearchBar!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var switchButton: UIBarButtonItem!
    
    fileprivate var presenter : MoviesPresenter!
    fileprivate var listOfMovies : List!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = MoviesPresenter(view: self as MoviesView, service: MovieFacade.self)
        presenter.getList()
        containerView.autoresizesSubviews = true
    }
        
    // SEARCH ACTION
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        print("end searching --> Close Keyboard")
        self.searchMoviesBar.endEditing(true)
    }
    
    // SEGMENTED CONTROL ACTION
    @IBAction func getMoviesAction(_ sender: UISegmentedControl) {
        presenter.selectedSegmentIndex = segmentedControl.selectedSegmentIndex

    }
    
    // SWITCH
    @IBAction func switchTableCollection(_ sender: UIBarButtonItem) {
        presenter.isTableViewActive = !presenter.isTableViewActive
    }
    
    func addConstraintsToListOfMovies() {
        if let listOfMoviesAsView = listOfMovies as? UIView {
            containerView.addSubview(listOfMoviesAsView)
            listOfMoviesAsView.autoresizesSubviews = true
            listOfMoviesAsView.translatesAutoresizingMaskIntoConstraints = false
            listOfMoviesAsView.leftAnchor.constraint(equalTo: (containerView.leftAnchor), constant: 0).isActive = true
            listOfMoviesAsView.rightAnchor.constraint(equalTo: (containerView.rightAnchor), constant: 0).isActive = true
            listOfMoviesAsView.topAnchor.constraint(equalTo: (containerView.topAnchor), constant: 0).isActive = true
            listOfMoviesAsView.bottomAnchor.constraint(equalTo: (containerView.bottomAnchor), constant: 0).isActive = true
        }
    }
    
    override func viewLayoutMarginsDidChange() {
        if(!presenter.isTableViewActive) {
            updateListOfMovies()
        }
    }
    
}

extension MoviesViewController : ListDelegate {
    func numberOfCells() -> Int {
        return presenter.moviesResponse!.movies!.count
    }
    
    func configureCell(cell: ListCell, index: Int) {
        cell.title.text = presenter.moviesResponse?.movies![index].title
        if(presenter.isTableViewActive) {
            cell.overview.text = presenter.moviesResponse?.movies![index].overview ?? ""
        }
        // Configure image
        if let imagePath = presenter.moviesResponse!.movies![index].posterPath {
            guard let url = try? "https://image.tmdb.org/t/p/w154\(imagePath)".asURL() else {
                fatalError("Error en la ruta de la imagen")
            }
            cell.imageMovie.af_setImage(withURL: url)
        }
    }
}

extension MoviesViewController : MoviesView {
    func updateListOfMovies() {
        listOfMovies.reloadAllData()
    }
    
    func changeTypeOfList() {
        // Configuro la lista dependiendo de si va a ser tabla o colección
        (listOfMovies as? UIView)?.removeFromSuperview()
        if(presenter.isTableViewActive) {
            listOfMovies = ListTableView(frame: CGRect(x: 0, y: 0, width: (containerView.bounds.width), height: (containerView.bounds.height)))
        } else {
            listOfMovies = ListCollectionView(frame: CGRect(x: 0, y: 0, width: (containerView.bounds.width), height: (containerView.bounds.height)))
        }
        switchButton.title = presenter.listTitle
        listOfMovies.listDelegate = self
        listOfMovies.reloadAllData()
        
        // Agrego constraints a la vista agregada
        addConstraintsToListOfMovies()
    }
}
