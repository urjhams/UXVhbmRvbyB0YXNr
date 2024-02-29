//
//  UsersViewController.swift
//  QuandooTask
//
//  Created by Quân Đinh on 29.02.24.
//

import UIKit

class UsersViewController: UIViewController {
  
  let viewModel = UserListViewModel()
  
  let tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    return tableView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground
    setupTableView()
    fetchData()
  }
  
}

// MARK: - Setup table view
extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
  
  private func setupTableView() {
    tableView.delegate = self
    tableView.dataSource = self
    tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.identifier)
    view.addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.users.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard 
      let cell = tableView.dequeueReusableCell(
        withIdentifier: UserCell.identifier, 
        for: indexPath
      ) as? UserCell
    else {
      return UITableViewCell()
    }
    cell.model = viewModel.users[safe: indexPath.row]
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    // TODO: show swiftUI Post view of the user
  }
}

// MARK: - Fetching request
extension UsersViewController {
  private func fetchData() {
    Task {
      do {
        let users = try await FetchingService.shared.getUsers()
        viewModel.setUsers(from: users)
        tableView.reloadData()
      } catch {
        let alert = UIAlertController(
          title: "Error",
          message: error.localizedDescription,
          preferredStyle: .alert
        )
        alert.addAction(.init(title: "Ok", style: .default))
      }
    }
  }
}

