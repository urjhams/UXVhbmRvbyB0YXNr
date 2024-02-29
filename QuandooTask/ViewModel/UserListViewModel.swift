//
//  UserListViewModel.swift
//  QuandooTask
//
//  Created by Quân Đinh on 29.02.24.
//

import Foundation

public class UserListViewModel {
  public struct UserInfo {
    var id: Int
    var name: String
    var email: String
    var address: String
  }
  
  var users: [UserInfo]
  
  public init(from model: [User]) {
    self.users = model.map { user in
      let address = user.address
      return UserInfo(
        id: user.id,
        name: user.name,
        email: user.email,
        address: "\(address.street) - \(address.suite) - \(address.city) - \(address.zipcode)"
      )
    }
  }
}
