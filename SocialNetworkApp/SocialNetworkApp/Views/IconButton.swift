//
//  IconButton.swift
//  SocialNetworkApp
//
//  Created by Matvei Khlestov on 08.04.2024.
//

import UIKit

final class IconButton: UIButton {

    init(image: UIImage) {
        super.init(frame: .zero)
        setupButton(with: image)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupButton(with image: UIImage) {
        backgroundColor = .appBlack
        setImage(image, for: .normal)
        layer.cornerRadius = 17
    }
}
