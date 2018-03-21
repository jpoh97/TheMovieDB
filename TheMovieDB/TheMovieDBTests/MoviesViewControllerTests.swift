//
//  MoviesViewControllerTests.swift
//  TheMovieDBTests
//
//  Created by Juan Pablo Ospina Herrera on 3/21/18.
//  Copyright © 2018 Globant. All rights reserved.
//

import XCTest
import UIKit
@testable import TheMovieDB

class MoviesViewControllerTests: XCTestCase {
    var viewController: MoviesViewController!
    
    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let identifier = String(describing: MoviesViewController.self)
        
        viewController = storyboard.instantiateViewController(withIdentifier: identifier) as! MoviesViewController
        _ = viewController.view
    }
    
    override func tearDown() {
        viewController = nil
        super.tearDown()
    }
    
    func testMoviesViewDidLoad() {
        //XCTAssertTrue(viewController.listOfMovies != nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
