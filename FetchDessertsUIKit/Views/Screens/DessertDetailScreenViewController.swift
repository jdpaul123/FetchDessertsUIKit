//
//  DessertDetailScreenViewController.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class DessertDetailScreenViewController: UIViewController {
    enum DessertDetailSection: Int {
        case image
        case ingredients
        case instructions
    }

    private let injector: Injector
    private let dessertID: String
    private let dessertImageURL: URL

    private var dessertDetails = DessertDetails(id: "", name: "", instructions: [], ingredients: []) {
        didSet {
            tableView.reloadData()
        }
    }

    private var imageData = UIImage(resource: .iceCreamDog).pngData()! {
        didSet {
            tableView.reloadData()
        }
    }

    private var tableView: UITableView!


    init(dessertID: String, dessertImageURL: URL, injector: Injector) {
        self.dessertID = dessertID
        self.dessertImageURL = dessertImageURL
        self.injector = injector
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        getDessertDetails()
        getImage()
    }

    private func getDessertDetails() {
        Task { [weak self] in
            guard let self else { return }
            if let dessertDetails = try? await injector.dataService.getDessertDetails(for: self.dessertID) {
                self.dessertDetails = dessertDetails
                print(dessertDetails.name)
            }
        }
    }

    private func getImage() {
        Task { [weak self] in
            guard let self else { return }
            if let imageData = try? await injector.dataService.getImageData(from: dessertImageURL) {
                self.imageData = imageData
            }
        }
    }


    private func configureTableView() {
        tableView = UITableView(frame: view.bounds, style: .insetGrouped)
        tableView.register(DessertImageTableViewCell.self, forCellReuseIdentifier: DessertImageTableViewCell.resuseIdentifier)
        tableView.register(DessertIngredientTableViewCell.self, forCellReuseIdentifier: DessertIngredientTableViewCell.resuseIdentifier)
        tableView.register(DessertInstructionTableViewCell.self, forCellReuseIdentifier: DessertInstructionTableViewCell.resuseIdentifier)
        tableView.dataSource = self
        view.addSubview(tableView)
    }
}

extension DessertDetailScreenViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // there is always 1 image
        case 1:
            return dessertDetails.ingredients.count
        case 2:
            return dessertDetails.instructions.count
        default:
            fatalError("Unknown section")
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = DessertImageTableViewCell(style: .default, reuseIdentifier: DessertImageTableViewCell.resuseIdentifier)
            cell.set(data: imageData)
            return cell
        case 1:
            return DessertIngredientTableViewCell(ingredient: dessertDetails.ingredients[indexPath.row])
        case 2:
            return DessertInstructionTableViewCell(instruction: dessertDetails.instructions[indexPath.row])
        default:
            fatalError("Unknown section")
        }
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return nil
        case 1:
            return "Ingredients"
        case 2:
            return "Instructions"
        default:
            fatalError("Unknown section")
        }
    }
}
