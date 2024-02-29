public struct Post: Decodable, Identifiable {
  public var userId: Int
  public var id: Int
  public var title: String
  public var body: String
}
