struct Post: Decodable, Identifiable {
  var userId: Int
  var id: Int
  var title: String
  var body: String
}
