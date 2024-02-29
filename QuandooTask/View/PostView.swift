import SwiftUI

struct PostView: View {
  
  let userId: Int
  
  @State var model = PostListViewModel()
  
  var body: some View {
    VStack {
      List(model.posts) { post in
        VStack(alignment: .leading, spacing: 5) {
          Text(post.title)
            .font(.title3)
            .fontWeight(.bold)
          Text(post.body)
        }
      }
    }
    .onAppear {
      Task {
        model.posts = (try? await FetchingService.shared.getPosts(userId: userId)) ?? []
      }
    }
  }
}

#Preview {
  PostView(userId: 1)
}
