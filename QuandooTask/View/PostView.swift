import SwiftUI

struct PostView: View {
  
  /// User id to indicate the posts to load and present
  let userId: Int
  
  @State var model = PostListViewModel()
  
  var body: some View {
    VStack {
      List(model.posts) { post in
        PostCell(of: post)
      }
    }
    .onAppear {
      Task {
        // load the model when appear
        model.posts = (try? await FetchingService.shared.getPosts(userId: userId)) ?? []
      }
    }
  }
}

extension PostView {
  @ViewBuilder private func PostCell(of post: Post) -> some View {
    VStack(alignment: .leading, spacing: 5) {
      Text(post.title)
        .font(.title3)
        .fontWeight(.bold)
      Text(post.body)
    }
  }
}

#Preview {
  PostView(userId: 1)
}
