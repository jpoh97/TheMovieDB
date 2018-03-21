//
//  MoviewDataTests.swift
//  TheMovieDBTests
//
//  Created by Juan Pablo Ospina Herrera on 3/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MoviewDataTests: XCTestCase {
    
    var movie : MovieData?
    let id = 1
    let title = "Nemo"
    let voteAverage = 9.8
    let overview = "Finding nemo overview..."
    let posterPath = "/n2vIGWw4ezslXjlP0VNxkp9wqwU.jpg"
    var movieJsonObject : [String : Any]?
    
    override func setUp() {
        super.setUp()
        
        movieJsonObject = [
            "id" : id,
            "title" : title,
            "overview" : overview,
            "vote_average" : voteAverage,
            "poster_path" : posterPath
        ]
        
    }
    
    override func tearDown() {
        movie = nil
        movieJsonObject = nil
        super.tearDown()
    }
    
    // Test correct data saved in a movie object
    
    func testCorrectMovieTitle() {
        movie = MovieData(movieJsonObject)
        XCTAssertTrue(movie?.title == title, "Correct title")
    }
    
    func testCorrectMovieId() {
        movie = MovieData(movieJsonObject)
        XCTAssertTrue(movie?.id == id, "Correct identifier")
    }
    
    func testCorrectMovieVoteAverage() {
        movie = MovieData(movieJsonObject)
        XCTAssertTrue(movie?.voteAverage == voteAverage, "Correct vote average")
    }
    
    func testCorrectMovieOverview() {
        movie = MovieData(movieJsonObject)
        XCTAssertTrue(movie?.overview == overview, "Correct overview")
    }
    
    func testCorrectMoviePosterPath() {
        movie = MovieData(movieJsonObject)
        XCTAssertTrue(movie?.posterPath == posterPath, "Correct poster path of the image")
    }
    
    func testCorrectMovieObject() {
        movie = MovieData(movieJsonObject)
        XCTAssertTrue(movie != nil, "Correct object created")
    }
    
    // Test data in movieResponse with Nil values
    
    func testMovieIdWithNilValue() {
        movieJsonObject?["id"] = nil
        movie = MovieData(movieJsonObject)
        XCTAssertEqual(movie?.id, 0, "Correct movie ID (0) with nil value")
    }
    
    func testMovieTitleWithNilValue() {
        movieJsonObject?["title"] = nil
        movie = MovieData(movieJsonObject)
        XCTAssertEqual(movie?.title, "", "Correct movie title (empty string) with nil value")
    }
    
    func testMovieOverviewWithNilValue() {
        movieJsonObject?["overview"] = nil
        movie = MovieData(movieJsonObject)
        XCTAssertEqual(movie?.overview, "", "Correct movie overview (empty string) with nil value")
    }
    
    func testMovieVoteAverageWithNilValue() {
        movieJsonObject?["vote_average"] = nil
        movie = MovieData(movieJsonObject)
        XCTAssertEqual(movie?.voteAverage, 0.0, "Correct movie vote average (0.0) with nil value")
    }
    
    func testMoviePosterPathWithNilValue() {
        movieJsonObject?["poster_path"] = nil
        movie = MovieData(movieJsonObject)
        XCTAssertEqual(movie?.posterPath, "", "Correct movie poster path (empty string) with nil value")
    }    
}
