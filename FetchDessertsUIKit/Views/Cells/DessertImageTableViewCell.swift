//
//  DessertImageCellTableViewCell.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class DessertImageTableViewCell: UITableViewCell {
    static let resuseIdentifier = "dessertImageCell"

    private let dessertImageView = FDImageView(frame: .zero)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
        configureImage()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(data: Data) {
        dessertImageView.image = UIImage(data: data)
    }

    private func configureView() {
        contentView.addSubview(dessertImageView)

        NSLayoutConstraint.activate([
            dessertImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            dessertImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            dessertImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            dessertImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }

    private func configureImage() {
        dessertImageView.image = UIImage(resource: .iceCreamDog)
        dessertImageView.contentMode = .scaleAspectFit
        dessertImageView.clipsToBounds = true
    }
}
