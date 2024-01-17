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
    private let dessertTitleLabel = FDTitleLabel(textAlignment: .left, fontSize: 16)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(dessert: Dessert) {
        dessertTitleLabel.text = dessert.name
//        Task {
//            await dessertImageView.getImage() // TODO: Fill this funciton out to take the URL and get the image
//        }
    }

    func configure() {
        contentView.addSubview(dessertImageView)
        contentView.addSubview(dessertTitleLabel)

        let padding: CGFloat = 8

        NSLayoutConstraint.activate([
            dessertImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            dessertImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            dessertImageView.widthAnchor.constraint(equalToConstant: 80),
            dessertImageView.heightAnchor.constraint(equalToConstant: 80),

            dessertTitleLabel.leadingAnchor.constraint(equalTo: dessertImageView.trailingAnchor, constant: padding),
            dessertTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            dessertTitleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
