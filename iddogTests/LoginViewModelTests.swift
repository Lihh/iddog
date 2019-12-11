//
//  LoginViewModelTests.swift
//  iddogTests
//
//  Created by Lidia Chou on 11/12/19.
//  Copyright © 2019 Lidia Chou. All rights reserved.
//

import XCTest
@testable import iddog

class LoginViewModelTests: XCTestCase {

    var sut: LoginViewModel!
    var loginController: LoginViewController!
    var login: Login!

    override func setUp() {
        super.setUp()
        sut = LoginViewModel()
        loginController = LoginViewController()
        login = Login(user: User(_id: "5d198b7129ed3fbf7eb2153f",
                                 email: "test@test.com",
                                 token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJpZGRvZy1zZXJ2aWNlIiwic3ViIjoiNWQxOThiNzEyOWVkM2ZiZjdlYjIxNTNmIiwiaWF0IjoxNTYxOTU1MTg1LCJleHAiOjE1NjMyNTExODV9.s1Z8_wcNMfKeIjtFVyU8oVqaCVCQhQqPUfWZH9EDUyI"))
    }

    override func tearDown() {
        sut = nil
        loginController = nil
        login = nil
        super.tearDown()
    }
    
    func testTitleTextFieldNotNill() {
        XCTAssertNotNil(sut.titleText)
    }
    
    func testLoginButtonTextFieldNotNill() {
        XCTAssertNotNil(sut.loginButtonText)
    }
    
    func testTextFieldPlaceholderNotNill() {
        XCTAssertNotNil(sut.textFieldPlaceholder)
    }
    
    func testEmailValidSuccess() {
        let validEmail = sut.isEmailValid("test@test.com")
        XCTAssertTrue(validEmail)
    }
    
    func testEmailValidFailure() {
        let invalidEmail = sut.isEmailValid("test")
        XCTAssertFalse(invalidEmail)
    }
    
    func testSaveTokenLocally() {
        let mockDefaults = MockUserDefaults.standard
        let tokenKey = Constants.Keys.token
        mockDefaults.set(login.user.token, forKey: tokenKey)
        XCTAssertEqual(mockDefaults.string(forKey: tokenKey), login.user.token)
    }
    
    func testSaveEmailLocally() {
        let mockDefaults = MockUserDefaults.standard
        let emailKey = Constants.Keys.email
        mockDefaults.set(login.user.email, forKey: emailKey)
        XCTAssertEqual(mockDefaults.string(forKey: emailKey), login.user.email)
    }
}


class MockUserDefaults: UserDefaults {
    convenience init() {
        self.init(suiteName: "Mock User Defaults")!
    }
    
    override init?(suiteName suitename: String?) {
        UserDefaults().removePersistentDomain(forName: suitename!)
        super.init(suiteName: suitename)
    }
}
