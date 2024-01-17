//
//  ViewController.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class DessertListScreenViewController: UIViewController, UITableViewDelegate {
    enum Section {
        case main
    }

    private var injector: Injector

    private var desserts = [Dessert]()
    private var tableView: UITableView!
    private var dataSource: UITableViewDiffableDataSource<Section, Dessert>!

    init(injector: Injector = Injector()) {
        self.injector = injector
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigationBar()
        configureTableView()
        getDesserts()
        configureDataSource()
    }

    /// Configures the navigation bar to display a large title and the title of the screen.
    private func configureNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Desserts"
    }

    /// Configures the table view to display the desserts.
    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.delegate = self
        tableView.register(DessertTableViewCell.self, forCellReuseIdentifier: DessertTableViewCell.resuseIdentifier)
        view.addSubview(tableView)
    }

    private func getDesserts() {
        Task { [weak self] in
            guard let self else { return }
            if let desserts = try? await injector.dataService.getDesserts() {
                self.desserts = desserts
                updateData()
            }
        }
    }

    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, Dessert>(tableView: tableView, cellProvider: { tableView, indexPath, dessert in
            let cell = tableView.dequeueReusableCell(withIdentifier: DessertTableViewCell.resuseIdentifier, for: indexPath) as! DessertTableViewCell
            cell.set(dessert: dessert)
            return cell
        })
    }

    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Dessert>()
        snapshot.appendSections([.main])
        snapshot.appendItems(desserts)
        dataSource.apply(snapshot, animatingDifferences: true)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
}

