//
//  FDImageView.swift
//  FetchDessertsUIKit
//
//  Created by Jonathan Paul on 1/16/24.
//

import UIKit

final class FDImageView: UIImageView {
    let placeholderImage = UIImage(resource: .iceCreamDog)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configure() {
        layer.cornerRadius = 10
        // The image needs to clip to bounds to take on the corner radius
        clipsToBounds = true
        image = placeholderImage
        contentMode = .scaleAspectFit
        translatesAutoresizingMaskIntoConstraints = false
    }

    // TODO: Fill this function out
    func getImage() async {

    }
}
