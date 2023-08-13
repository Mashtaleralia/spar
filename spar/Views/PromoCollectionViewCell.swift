//
//  PromoCollectionViewCell.swift
//  spar
//
//  Created by Admin on 12.08.2023.
//

import UIKit

class PromoCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "PromoCollectionViewCell"
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 20.0
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(with image: String) {
        imageView.image = UIImage(named: image)
    }
}
