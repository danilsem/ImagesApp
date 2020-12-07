//
//  ImageDetailsViewController.swift
//  UnsplashPhoto
//
//  Created by Admin on 30.11.2020.
//  Copyright (c) 2020 Danil Semenov. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit
import RxSwift
import RxCocoa
import Kingfisher

final class ImageDetailsViewController: UIViewController {

    // MARK: - Public properties -

    var presenter: ImageDetailsPresenterInterface!

    // MARK: - Private properties -

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var photoDescriptionLabel: UILabel!
    @IBOutlet weak var rightBlockView: UIView!
    @IBOutlet weak var leftBlockConstraint: NSLayoutConstraint!
    
    private let disposeBag = DisposeBag()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
        setupView()
    }
}

// MARK: - Extensions -

extension ImageDetailsViewController: ImageDetailsViewInterface {
}

private extension ImageDetailsViewController {
    func configureViews() {
        photoImage.kf.indicatorType = .activity
        
        self.photoDescriptionLabel.alpha = 0
        self.rightBlockView.alpha = 0
    }

    func setupView() {
        let output = ImageDetails.ViewOutput()

        let input = presenter.configure(with: output)
        
        input.photoDescription
            .drive(photoDescriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        input.photoImageUrl
            .do { [photoImage] (url) in
                photoImage?.kf.setImage(
                    with: url,
                    options: [
                        .transition(.fade(1))
                    ],
                    completionHandler: { [weak self] _ in
                        self?.makeAnimations()
                    }
                )
            }
            .drive()
            .disposed(by: disposeBag)
    }

}

private extension ImageDetailsViewController {
    func makeAnimations() {
        UIView.animate(withDuration: 0.3, delay: 0, options: [.curveEaseOut]) {
            self.photoDescriptionLabel.alpha = 1
            self.rightBlockView.alpha = 1
        }
    }
}
