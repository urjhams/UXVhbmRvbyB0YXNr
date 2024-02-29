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
  /// Get the list of user objects
  /// - Returns: the list of users
  public func getUsers() async throws -> [User] {
    let request = Request(from: "https://jsonplaceholder.typicode.com/users", as: .get)
    return try await Networking.shared.getObject([User].self, from: request)
  }
  
  
  /// Get the list of Post from an User
  /// - Parameter userId: the User Identifier
  /// - Returns: The list of posts from coressponded user
  public func getPosts(userId: Int) async throws -> [Post] {
    let request = Request(
      from: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)",
      as: .get
    )
    return try await Networking.shared.getObject([Post].self, from: request)
  }
  
  
}
