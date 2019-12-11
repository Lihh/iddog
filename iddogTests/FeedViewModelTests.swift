//
//  FeedViewModelTests.swift
//  iddogTests
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import XCTest
@testable import iddog

class FeedViewModelTests: XCTestCase {

    var sut: FeedViewModel!
    var feedController: FeedViewController!
    var dogImagesList = ["https://images.dog.ceo/breeds/husky/n02110185_10047.jpg",
                         "https://images.dog.ceo/breeds/husky/n02110185_10116.jpg",
                         "https://images.dog.ceo/breeds/husky/n02110185_10171.jpg"]

    override func setUp() {
        super.setUp()
        sut = FeedViewModel()
        feedController = FeedViewController()
    }

    override func tearDown() {
        sut = nil
        feedController = nil
        super.tearDown()
    }
    
    func testNavigationTitleTextNotNull() {
        XCTAssertNotNil(sut.navTitle)
    }
    
    func testDescriptionTextNotNull() {
        XCTAssertNotNil(sut.descriptionText)
    }
    
    func testTextFieldEnabledPlaceholderNotNull() {
        XCTAssertNotNil(sut.textFieldEnabledPlaceholder)
    }
    
    func testTextFieldDisabledPlaceholderNotNull() {
        XCTAssertNotNil(sut.textFieldDisabledPlaceholder)
    }
    
    func testSearchButtonTextNotNull() {
        XCTAssertNotNil(sut.searchButtonText)
    }
    
    func testGetImagesFromUrlList() {
        sut.getImagesUrlFromList(dogImagesList)
        XCTAssertNotNil(sut.dogImagesUrl)
    }
}
