//
//  DiscountedProductCollectionViewCell.swift
//  spar
//
//  Created by Admin on 14.08.2023.
//

import UIKit

class DiscountedProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DiscountedProductCollectionViewCell"

    
    private let toCartButton: UIButton = {
        let button = UIButton()
        //button.layer.masksToBounds = true
        button.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        button.backgroundColor = .systemGreen
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 15.0
        return button
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 15
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        //label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let dimensionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        //label.layer.masksToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let discountLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .red
        //label.text = "35%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
       label.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.7)
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(toCartButton)
        contentView.addSubview(productImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(dimensionLabel)
        contentView.addSubview(discountLabel)
        contentView.addSubview(previousPriceLabel)
        contentView.addSubview(discountTagView)
        contentView.clipsToBounds = true
        backgroundColor = .white
        addConstraints()
    }
    
    private let previousPriceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        let attributeString: NSMutableAttributedString = NSMutableAttributedString()
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        label.attributedText = attributeString
        label.font = .systemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addConstraints() {
        productImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height*0.75).isActive = true
  
        
        //priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -25).isActive = true
        previousPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        previousPriceLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor).isActive = true
       
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
     
        dimensionLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5).isActive = true
        dimensionLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
        toCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        toCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        toCartButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        toCartButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        discountLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        discountLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        discountLabel.centerXAnchor.constraint(equalTo: toCartButton.centerXAnchor).isActive = true
        discountLabel.bottomAnchor.constraint(equalTo: toCartButton.topAnchor, constant:-5).isActive = true
     
    }
    

    
    public func configure(with model: ProductModel) {
        guard let discount = model.discount else {
            return
        }
        productImageView.image = UIImage(named: model.image)
        
        priceLabel.text = model.discountedPrice
        dimensionLabel.text = model.dispalyDimension
       
        discountLabel.text = String(discount) + "%"
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: String(model.price))
            attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSRange(location: 0, length: attributeString.length))
        previousPriceLabel.attributedText = attributeString
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        priceLabel.text = nil
        productImageView.image = nil
        dimensionLabel.text = nil

   
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
