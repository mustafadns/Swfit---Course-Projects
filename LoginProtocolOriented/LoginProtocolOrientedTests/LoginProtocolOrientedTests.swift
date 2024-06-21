//
//  LoginProtocolOrientedTests.swift
//  LoginProtocolOrientedTests
//
//  Created by Mustafa DANIŞAN on 16.06.2024.
//

import XCTest
@testable import LoginProtocolOriented

final class LoginProtocolOrientedTests: XCTestCase {
    
    private var viewModel : RootViewModel!
    private var loginStorageService : MockLoginStorageService!
    private var output : MockRootViewModelOutpu!

    override func setUpWithError() throws {
        
        loginStorageService = MockLoginStorageService()
        viewModel = RootViewModel(loginStorageService: loginStorageService)
        output = MockRootViewModelOutpu()
        
        viewModel.output = output
        
    }

    override func tearDownWithError() throws {
        viewModel = nil
        loginStorageService = nil
    }

    func testShowLogin_whenLoginStorageReturnsEmptyUserAccessToken() throws {
        loginStorageService.storage = [:]
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
    func testShowLogin_whenLoginStorageReturnsEmptyStrings() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = ""
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .login)
    }
    
    func testShowMainApp_whenLoginStorageReturnsUserAccessToken() throws {
        loginStorageService.storage["ACCESS_TOKEN"] = "277448484DDDHDHDH848"
        viewModel.checkLogin()
        XCTAssertEqual(output.checkArray.first, .mainApp)
    }
    
}

class MockLoginStorageService : LoginStorageService {
    var userAccessTokenKey: String {
        return "ACCESS_TOKEN"
    }
    
    var storage : [String : String] = [:]
    func setUserAccessToken(token: String) {
        storage[userAccessTokenKey] = token
    }
    
    func getUserAccessToken() -> String? {
        return storage[userAccessTokenKey]
    }
}

class MockRootViewModelOutpu : RootViewModelOutput {
    
    enum Check {
        case login
        case mainApp
    }
    
    var checkArray : [Check] = []
    
    func showLogin() {
        checkArray.append(.login)
    }
    
    func showMainApp() {
        checkArray.append(.mainApp)
    }
    
    
}
