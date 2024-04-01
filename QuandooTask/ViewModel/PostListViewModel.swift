import SwiftUI
import Networking

@Observable public class PostListViewModel {
  @MainActor
  var posts: [Post] = []
  
  @MainActor
  func getPosts(userId: Int) async throws -> [Post] {
    let request = Request(
      from: "https://jsonplaceholder.typicode.com/posts?userId=\(userId)",
      as: .get
    )
    return try await Networking.shared.getObject([Post].self, from: request)
  }
  
  @MainActor
  func fetchPosts(userId: Int) async throws {
    posts = try await getPosts(userId: userId)
  }
}
