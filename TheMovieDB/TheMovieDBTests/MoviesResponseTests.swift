//
//  MoviesResponseTests.swift
//  TheMovieDBTests
//
//  Created by Juan Pablo Ospina Herrera on 3/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
@testable import TheMovieDB

class MoviesResponseTests: XCTestCase {
    
    var jsonResponseObject : [String : Any]?
    var movieJsonObject : [[String : Any]]?
    var moviesResponse : MoviesResponse?
    
    override func setUp() {
        super.setUp()
        movieJsonObject = [
            [
                "id" : 1,
                "title" : "Nemo",
                "overview" : "Finding nemo overview...",
                "vote_average" : 9.8,
                "poster_path" : "/n2vIGWw4ezslXjlP0VNxkp9wqwU.jpg"
            ]
        ]
        jsonResponseObject = [
            "page" : 1,
            "total_pages" : 10,
            "results" : movieJsonObject ?? [[String : Any]]()
        ]
    }
    
    override func tearDown() {
        movieJsonObject = nil
        jsonResponseObject = nil
        moviesResponse = nil
        super.tearDown()
    }
    
    func testMoviesResponseObjectCreated() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertTrue(moviesResponse != nil, "Correct moviesResponse created")
    }
    
    // Test correct data saved in moviesResponse
    
    func testCorrectJsonPage() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.page, jsonResponseObject?["page"] as? Int, "Correct json page")
    }
    
    func testCorrectJsonTotalPages() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.totalPages, jsonResponseObject?["total_pages"] as? Int, "Correct json total pages")
    }
    
    func testCorrectMovieResponseId() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.movies?[0].id , movieJsonObject?[0]["id"] as? Int, "Correct json total pages")
    }
    
    func testCorrectMovieResponseTitle() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.movies?[0].title , movieJsonObject?[0]["title"] as? String, "Correct json total pages")
    }
    
    func testCorrectMovieResponseOverview() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.movies?[0].overview , movieJsonObject?[0]["overview"] as? String, "Correct json total pages")
    }
    
    func testCorrectMovieResponseVoteAverage() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.movies?[0].voteAverage , movieJsonObject?[0]["vote_average"] as? Double, "Correct json total pages")
    }
    
    func testCorrectMovieResponsePosterPath() {
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.movies?[0].posterPath , movieJsonObject?[0]["poster_path"] as? String, "Correct json total pages")
    }
    
    // Test data in movieResponse with Nil values
    
    func testMovieResponsePageWithNilValue() {
        jsonResponseObject?["page"] = nil
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.page, 0, "Correct json page with nil value")
    }
    
    func testMovieResponseTotalPagesWithNilValue() {
        jsonResponseObject?["total_pages"] = nil
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
        XCTAssertEqual(moviesResponse?.totalPages, 0, "Correct json total pages with nil value")
    }
    
    func testMovieResponseResultsWithNilValue() {
        jsonResponseObject?["results"] = nil
        moviesResponse = MoviesResponse(res: jsonResponseObject!)
//        XCTAssertEqual(moviesResponse!.movies as! [MovieData], [MovieProtocol]() as! [MovieData], "Correct json results with nil value")
    }
}
