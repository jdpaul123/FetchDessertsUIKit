//
//  DessertInstructionsTableViewCell.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class DessertInstructionTableViewCell: UITableViewCell {
    static let resuseIdentifier = "dessertInstructionCell"

    private let instructionLabel = FDBodyLabel(textAlignment: .left)

    init(instruction: String) {
        super.init(style: .default, reuseIdentifier: Self.resuseIdentifier)
        instructionLabel.text = instruction
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureLayout() {
        contentView.addSubview(instructionLabel)

        let padding: CGFloat = 20

        NSLayoutConstraint.activate([
            instructionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            instructionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            instructionLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            instructionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
        ])
    }
}
