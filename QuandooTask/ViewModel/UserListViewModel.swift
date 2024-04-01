//
//  UserListViewModel.swift
//  QuandooTask
//
//  Created by Quân Đinh on 29.02.24.
//

import Foundation
import Networking

public class UserListViewModel {
  public struct UserInfo {
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: String
  }
  
  @MainActor 
  var users: [UserInfo] = []
  
  @MainActor
  private func convertedInfo(from user: User) -> UserInfo {
    let address = user.address
    return UserInfo(
      id: user.id,
      name: user.name,
      username: user.username,
      email: user.email,
      address: "\(address.street) - \(address.suite) - \(address.city) - \(address.zipcode)"
    )
  }
  
  @MainActor 
  public func setUsers(from model: [User]) {
    users = model.map(convertedInfo)
  }
  
  @MainActor
  func fetchUsers() async throws -> [UserInfo] {
    let request = Request(from: "https://jsonplaceholder.typicode.com/users", as: .get)
    let users = try await Networking.shared.getObject([User].self, from: request)
    return users.map(convertedInfo)
  }
  
  @MainActor
  func fetchUserInformations() async throws {
    users = try await fetchUsers()
  }
}
