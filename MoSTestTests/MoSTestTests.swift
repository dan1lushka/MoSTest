//
//  MoSTestTests.swift
//  MoSTestTests
//
//  Created by Daniel Rybak on 04/03/2021.
//

import XCTest
@testable import MoSTest

class MoSTestTests: XCTestCase {

    func testMovieListManagerExampleWithData() throws {
        let manager = MovieListManager.exampleWithData
        print(manager.errorMessage)
        XCTAssertTrue(manager.imdbResponse.items.count > 0, "Should start with initial items")
        XCTAssertTrue(manager.state == MovieListManager.MovieListManagerState.withData, "Should have withData state")
        XCTAssertTrue(manager.errorMessage == "", "Should have empty error message, not \(manager.errorMessage)")
    }

    func testMovieListManagerEmptyExample() throws {
        let manager = MovieListManager.emptyExample
        XCTAssertTrue(manager.imdbResponse.items.count == 0, "Should start with no items")
        XCTAssertTrue(manager.state == MovieListManager.MovieListManagerState.empty, "Should have empty state")
        XCTAssertTrue(manager.errorMessage == "", "Should have empty error message, not \(manager.errorMessage)")
    }
    
    func testMovieListManagerExampleWithError() throws {
        let manager = MovieListManager.exampleWithError
        XCTAssertTrue(manager.state == MovieListManager.MovieListManagerState.withError, "Should have withError state")
        XCTAssertTrue(manager.errorMessage != "", "Should have an error message")
    }

    func testMovieListManagerErrorInvalidURL() throws {
        let manager = MovieListManager(url: "")
        XCTAssertTrue(manager.state == MovieListManager.MovieListManagerState.withError, "Should have withError state")
        XCTAssertTrue(manager.errorMessage == "Invalid URL", "Should have an error message: Invalid URL, not \(manager.errorMessage)")
    }

    func testMovieListManagerOnDelete() throws {
        let manager = MovieListManager.exampleWithData
        manager.delete(at: IndexSet(integer: 0))
        XCTAssertTrue(manager.imdbResponse.items.count == 1, "MovieListManager.exampleWithData Should have 1 element left, not \(manager.imdbResponse.items.count)")
    }
    
    func testMovieListManagerOnDeleteAllItemsCausesStateChange() throws {
        let manager = MovieListManager.exampleWithData
        manager.delete(at: IndexSet(integer: 0))
        manager.delete(at: IndexSet(integer: 0))
        XCTAssertTrue(manager.imdbResponse.items.count == 0, "MovieListManager.exampleWithData Should have no elements left, not \(manager.imdbResponse.items.count)")
        XCTAssertTrue(manager.state == .empty, "MovieListManager.exampleWithData state should be .empty, not \(manager.state)")
    }
    
    func testMovieListManagerOnMove() throws {
        let manager = MovieListManager.exampleWithData
        manager.move(indeces: IndexSet(integer: 0), newOffset: 1)
        manager.move(indeces: IndexSet(integer: 1), newOffset: 0)
        XCTAssertTrue(manager.imdbResponse.items[0].title == "title1", "MovieListManager.exampleWithData 0th element should be 1st")
        XCTAssertTrue(manager.imdbResponse.items[1].title == "title", "MovieListManager.exampleWithData 1st element should be 0th")
    }
}
