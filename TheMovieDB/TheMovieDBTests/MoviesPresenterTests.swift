//
//  MoviesPresenterTests.swift
//  TheMovieDBTests
//
//  Created by Juan Pablo Ospina Herrera on 3/22/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import UIKit
@testable import TheMovieDB

class MockListMoviesView : MoviesView {
    var updateListOfMoviesCalled = false
    var changeTypeOfListCalled =  false
    
    func updateListOfMovies() {
        updateListOfMoviesCalled = true
    }
    
    func changeTypeOfList() {
        changeTypeOfListCalled = true
    }
}

class MockMovieFacade : MoviesService {
    
    static func mockResponse() -> MoviesResponse {
        let movieJsonObject = [
            [
                "id" : 1,
                "title" : "Nemo",
                "overview" : "Finding nemo overview...",
                "vote_average" : 9.8,
                "poster_path" : "/n2vIGWw4ezslXjlP0VNxkp9wqwU.jpg"
            ]
        ]
        let jsonResponseObject = [
            "page" : 1,
            "total_pages" : 10,
            "results" : movieJsonObject ?? [[String : Any]]()
            ] as [String : Any]
        return MoviesResponse(res: jsonResponseObject)!
    }
    
    static func getSearchedMovies(query: String, page: Int, completion: @escaping (MoviesResponse) -> ()) {
        completion(MockMovieFacade.mockResponse())
    }
    
    static func getList(page: Int, typeOfList: TypeOfLists, completion: @escaping (MoviesResponse) -> ()) {
        completion(MockMovieFacade.mockResponse())
    }
}

class MoviesPresenterTests: XCTestCase {
  
    func testMoviesPresenter() {
        let mockListMovies = MockListMoviesView()
        let presenter = MoviesPresenter(view: mockListMovies, service: MockMovieFacade.self)
        presenter.searchMovie()
        XCTAssertTrue(mockListMovies.updateListOfMoviesCalled, "test")
        presenter.selectedSegmentIndex = 2
        XCTAssertTrue(mockListMovies.changeTypeOfListCalled, "test")
        XCTAssertEqual(presenter.moviesResponse?.totalPages, 10, "")
    }
    
}

