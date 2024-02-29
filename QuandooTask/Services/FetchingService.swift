import Networking
import Foundation

public protocol Fetching {
  func getUsers() async throws -> UserListViewModel
  func getPosts(userId: Int) async throws -> [Post]
}

public class FetchingService {
  private init() {}
  public static let shared = FetchingService()
}

extension FetchingService: Fetching {
  public func getUsers() async throws -> UserListViewModel {
    let request = Request(from: "https://jsonplaceholder.typicode.com/users", as: .get)
    let users = try await Networking.shared.getObject([User].self, from: request)
    return .init(from: users)
  }
  
  public func getPosts(userId: Int) async throws -> [Post] {
    let request = Request(
      from: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)",
      as: .get
    )
    return try await Networking.shared.getObject([Post].self, from: request)
  }
  
  
}
