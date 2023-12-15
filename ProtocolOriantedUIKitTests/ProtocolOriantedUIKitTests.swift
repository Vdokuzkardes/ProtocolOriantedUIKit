//
//  ProtocolOriantedUIKitTests.swift
//  ProtocolOriantedUIKitTests
//
//  Created by Vedat Dokuzkardeş on 12.12.2023.
//

import XCTest
@testable import ProtocolOriantedUIKit

final class ProtocolOriantedUIKitTests: XCTestCase {
    
    private var userViewModel : UserViewModel!
    private var userService : MockUserService!
    private var output : MockUserViewModelOutput!

    override func setUpWithError() throws {
        userService = MockUserService()
        userViewModel = UserViewModel(userService: userService)
        output = MockUserViewModelOutput()
        userViewModel.output = output
    }

    override func tearDownWithError() throws {
        userService = nil
        userViewModel = nil
    }

    func testUpdateView_whenAPISuccess_showNameEmailUsername() throws {
        
        let mockUser = User(id: 1, name: "Vedat", username: "vedatdokuzkardes", email: "vedat@gmail.com", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), phone: "", website: "", company: Company(name: "", catchPhrase: "", bs: ""))
        
        userService.fetchUserMockResult = .success(mockUser)
        
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.userName, "vedatdokuzkardes")

    }
    
    func testUpdateView_whenAPIFailure_showNoUser() throws {
        
        userService.fetchUserMockResult = .failure(NSError())
        
        userViewModel.fetchUsers()
        
        XCTAssertEqual(output.updateViewArray.first?.name, "No user")
    }



}

class MockUserService : UserService {
    
    var fetchUserMockResult : Result<ProtocolOriantedUIKit.User, Error>?
    
    func fethUser(completion: @escaping (Result<ProtocolOriantedUIKit.User, Error>) -> Void) {
        if let result = fetchUserMockResult{
            completion(result)
        }
    }
    
    
}

class MockUserViewModelOutput : UserViewModelOutput {
    var updateViewArray : [(name: String, email: String, userName: String)] = []
    func updateView(name: String, email: String, userName: String) {
        updateViewArray.append((name, email, userName))
    }
}
