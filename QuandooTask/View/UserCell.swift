import UIKit

public final class UserCell: UITableViewCell {
  
  static let identifier = "UserCell"
  
  var model: UserListViewModel.UserInfo? {
    didSet {
      update()
    }
  }
  
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let usernameLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let emailLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let addressLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  private func update() {
    nameLabel.text = model?.name
    usernameLabel.text = model?.username
    emailLabel.text = model?.email
    addressLabel.text = model?.address
  }
  
  private func setupLabels() {
    let stackView = UIStackView(arrangedSubviews: [
      nameLabel, usernameLabel, emailLabel, addressLabel
    ])
    stackView.alignment = .leading
    stackView.axis = .vertical
    stackView.spacing = 4
    
    stackView.translatesAutoresizingMaskIntoConstraints = false
    contentView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public override init(
    style: UITableViewCell.CellStyle,
    reuseIdentifier: String?
  ) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupLabels()
  }
}
