//
//  DessertIngredientsTableViewCell.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class DessertIngredientTableViewCell: UITableViewCell {
    static let resuseIdentifier = "dessertIngredientCell"

    private let ingredientLabel = FDTitleLabel(textAlignment: .left, fontSize: 17)
    private let measureLabel = FDTitleLabel(textAlignment: .right, fontSize: 17)

    init(ingredient: DessertDetails.Ingredient) {
        super.init(style: .default, reuseIdentifier: Self.resuseIdentifier)
        ingredientLabel.text = ingredient.name
        measureLabel.text = ingredient.measure
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        contentView.addSubview(ingredientLabel)
        contentView.addSubview(measureLabel)

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            ingredientLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            ingredientLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            ingredientLabel.widthAnchor.constraint(equalToConstant: contentView.bounds.width / 2),
            ingredientLabel.heightAnchor.constraint(equalToConstant: 115),

            measureLabel.leadingAnchor.constraint(equalTo: ingredientLabel.trailingAnchor, constant: padding),
            measureLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            measureLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
