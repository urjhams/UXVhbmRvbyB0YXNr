public struct Geo: Decodable {
  public var lat: String
  public var lng: String
}

public struct Address: Decodable {
  public var street: String
  public var suite: String
  public var city: String
  public var zipcode: String
  public var geo: Geo
}

public struct Company: Decodable {
  public var name: String
  public var catchPhrase: String
  public var bs: String
}

public struct User: Decodable {
  public var id: Int
  public var name: String
  public var username: String
  public var email: String
  public var address: Address
  public var phone: String
  public var website: String
  public var company: Company
}
