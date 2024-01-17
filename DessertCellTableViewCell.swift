//
//  DessertCellTableViewCell.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class DessertTableViewCell: UITableViewCell {
    static let resuseIdentifier = "dessertCell"

    private let dessertImageView = FDImageView(frame: .zero)
    private let dessertTitleLabel = FDTitleLabel(textAlignment: .left, fontSize: 17)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(dessert: Dessert) {
        dessertTitleLabel.text = dessert.name
        if let imageData = dessert.photoData {
            dessertImageView.image = UIImage(data: imageData)
        }
    }

    func configure() {
        contentView.addSubview(dessertImageView)
        contentView.addSubview(dessertTitleLabel)

        NSLayoutConstraint.activate([
            dessertImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            dessertImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dessertImageView.widthAnchor.constraint(equalToConstant: 115),
            dessertImageView.heightAnchor.constraint(equalToConstant: 115),

            dessertTitleLabel.leadingAnchor.constraint(equalTo: dessertImageView.trailingAnchor, constant: 10),
            dessertTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dessertTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
