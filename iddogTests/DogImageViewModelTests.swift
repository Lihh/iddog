//
//  DogImageViewModelTests.swift
//  iddogTests
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import XCTest
@testable import iddog

class DogImageViewModelTests: XCTestCase {
    var sut: DogImageViewModel!

    override func setUp() {
        super.setUp()
        let imageUrl = URL(string: "https://images.dog.ceo/breeds/husky/n02110185_10047.jpg")!
        sut = DogImageViewModel(imageUrl: imageUrl,
                                breed: "Husky")
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }
    
    func testNavigationTitleTextNotNill() {
        XCTAssertNotNil(sut.navTitle)
    }
    
    func testGetDogImageFromURLSuccess() {
        XCTAssertNotNil(sut.getDogImageUrl)
    }
}
