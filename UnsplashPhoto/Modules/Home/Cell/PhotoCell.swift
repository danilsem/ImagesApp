//
//  PhotoCell.swift
//  UnsplashPhoto
//
//  Created by Admin on 18.11.2020.
//

import UIKit
import Kingfisher

class PhotoCell: UICollectionViewCell {
    static let identifier = String(describing: self)
    
    private lazy var photoImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        self.addSubview(photoImage)
        photoImage.clipsToBounds = true
        
        photoImage.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        photoImage.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        photoImage.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        photoImage.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
    
    func configure(using viewModel: PhotoViewModel) {
        self.photoImage.kf.indicatorType = .activity
        self.photoImage.kf.setImage(
            with: viewModel.thumbUrl,
            options: [
                .transition(.fade(1)),
                
            ]
        )
    }
}
