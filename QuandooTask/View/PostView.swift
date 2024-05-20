import SwiftUI

struct PostView: View {
  
  /// User id to indicate the posts to load and present
  let userId: Int
  
  @State var model = PostListViewModel()
  
  @State private var showAlert = false
  @State private var alertContent = "This is alert content"
  
  @State var isFetching = false
  
  var body: some View {
    VStack {
      List(model.posts) { post in
        PostCell(of: post)
      }
      .refreshable {
        await fetching()
      }
    }
    .alert(.init("Error"), isPresented: $showAlert) {
      Button { } label: { Text("Ok") }
    } message: {
      Text(alertContent)
    }
    .task {
      await fetching()
    }
    .opacity(isFetching ? 0 : 1)
    .overlay {
      if isFetching {
        ProgressView()
      }
    }
  }
}

extension PostView {
  private func fetching() async {
    // load the model when appear
    isFetching = true
    do {
      try await model.fetchPosts(userId: userId)
    } catch {
      showAlert.toggle()
      alertContent = error.localizedDescription
    }
    isFetching = false
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
