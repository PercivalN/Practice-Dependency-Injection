//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Percy Ngan on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

@testable import iTunes_Search

/*
What dependencies do you see?
- URLSession
- ResultType
- URL
- URLRequest
- SearchTerm
- URLQueryItem

What are tests that we can create?
- Are we decoding properly?
- Are we constructing the URL correctly?
- SearchResults should not be empty?
	- empty? Nothing to return / something is wrong
- Fails elegantly with bad data
- Is our completion handler always called?
- Feature: provide the error back to the caller
*/

class SearchResultControllerTests: XCTestCase {

	func testSearchResultController() {

		let controller = SearchResultController()
		let completionCalled = expectation(description: "SearchResultsReturned")
		controller.performSearch(for: "Garage Band", resultType: .software) {
			completionCalled.fulfill()

		}
		waitForExpectations(timeout: 5) { (error) in

			XCTAssertTrue(controller.searchResults.count > 0)
		}
	}
}
