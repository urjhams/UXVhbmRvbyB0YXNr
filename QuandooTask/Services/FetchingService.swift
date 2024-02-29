import Networking
import Foundation

public protocol Fetching {
  func getUsers() async throws -> [User]
  func getPosts(userId: Int) async throws -> [Post]
}

public class FetchingService {
  private init() {}
  public static let shared = FetchingService()
}

extension FetchingService: Fetching {
  public func getUsers() async throws -> [User] {
    let request = Request(from: "https://jsonplaceholder.typicode.com/users", as: .get)
    return try await Networking.shared.getObject([User].self, from: request)
  }
  
  public func getPosts(userId: Int) async throws -> [Post] {
    let request = Request(
      from: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)",
      as: .get
    )
    return try await Networking.shared.getObject([Post].self, from: request)
  }
  
  
}
