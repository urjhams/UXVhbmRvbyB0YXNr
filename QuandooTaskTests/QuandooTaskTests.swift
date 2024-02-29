//
//  QuandooTaskTests.swift
//  QuandooTaskTests
//
//  Created by Quân Đinh on 29.02.24.
//

import XCTest
@testable import QuandooTask

final class QuandooTaskUserViewTests: XCTestCase {
  
  let controller = UsersViewController()
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    try super.tearDownWithError()
  }
  
  func testEmptyPostListAtInitial() {
    XCTAssertTrue(controller.tableView.numberOfRows(inSection: 0) == 0)
  }
}

final class QuandooTaskPostViewTests: XCTestCase {
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    try super.tearDownWithError()
  }
  
}

final class QuandooTaskFetchingTests: XCTestCase {
  let service = FetchingService.shared
  
  override func setUpWithError() throws {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    try super.setUpWithError()
  }
  
  override func tearDownWithError() throws {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    try super.tearDownWithError()
  }
  
  func testFetchingUsersNotEmpty() async throws {
    
    let expectation = XCTestExpectation(description: "the users must not be an empty array")
    
    let result = try await service.getUsers()
    
    if !result.isEmpty {
      expectation.fulfill()
    }
    
    await fulfillment(of: [expectation], timeout: 1.0)
  }
  
  func testFetchingPostNotEmpty() async throws {
    let expectation = XCTestExpectation(description: "the posts must not be an empty array")
    
    let result = try await service.getPosts(userId: 1)
    
    if !result.isEmpty {
      expectation.fulfill()
    }
    
    await fulfillment(of: [expectation], timeout: 1.0)
  }

}
