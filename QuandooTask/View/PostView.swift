import SwiftUI

struct PostView: View {
  
  /// User id to indicate the posts to load and present
  let userId: Int
  
  @State var model = PostListViewModel()
  
  @State private var showAlert = false
  @State private var alertContent = "This is alert content"
  
  var body: some View {
    VStack {
      List(model.posts) { post in
        PostCell(of: post)
      }
    }
    .alert(.init("Error"), isPresented: $showAlert) {
      Button { } label: { Text("Ok") }
    } message: {
      Text(alertContent)
    }
    .onAppear {
      Task {
        // load the model when appear
        do {
          try await model.fetchPosts(userId: userId)
        } catch {
          showAlert.toggle()
          alertContent = error.localizedDescription
        }
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
