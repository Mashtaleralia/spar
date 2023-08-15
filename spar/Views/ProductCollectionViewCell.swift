//
//  RecommendedCollectionViewCell.swift
//  spar
//
//  Created by Admin on 13.08.2023.
//

import UIKit

struct ProductModel {
    var price: Float
    var dimension: String
    var image: String
    var dispalyDimension: String {
        "₽/" + dimension
    }
    var isDiscounted: Bool = false
    var discount: Int? = nil
    var discountedPrice: String? {
        guard let discount = discount else {
            return nil
        }
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        let value = (1 - Float(discount)*0.01)*price
        let number = NSNumber(value: value)
        let formattedValue = formatter.string(from: number)!
        return formattedValue
    }
    
}

class ProductCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ProductCollectionViewCell"
    
    private var isDiscounted = false
    
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
    
 
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(toCartButton)
        contentView.addSubview(productImageView)
        contentView.addSubview(priceLabel)
        contentView.addSubview(dimensionLabel)

        //contentView.clipsToBounds = false
        backgroundColor = .white
      
        addConstraints()
        //configureDiscount()
    }
    
 
    
    private func addConstraints() {
        productImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        productImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        productImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: contentView.frame.height*0.75).isActive = true
  
        
        //priceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
    
       
        priceLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
     
        dimensionLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 5).isActive = true
        dimensionLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor).isActive = true
        toCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        toCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        toCartButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        toCartButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    
    }
    

    
    public func configure(with model: ProductModel) {
        productImageView.image = UIImage(named: model.image)
        priceLabel.text = String(model.price)
        dimensionLabel.text = model.dispalyDimension
      
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
