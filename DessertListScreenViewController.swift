//
//  ViewController.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

class DessertListScreenViewController: UIViewController {
    enum Section {
        case main
    }
    var tableView: UITableView!
    var dataSource: UITableViewDiffableDataSource<Section, Dessert>!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemPink
    }


}

