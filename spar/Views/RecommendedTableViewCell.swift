//
//  RecommendedTableViewCell.swift
//  spar
//
//  Created by Admin on 13.08.2023.
//

import UIKit

class RecommendedTableViewCell: UITableViewCell, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    static let identifier = "RecommendedTableViewCell"
    
    
    private let productData = [ProductModel(price: 109.90, dimension: "шт", image: "ketchup"), ProductModel(price: 75.90, dimension: "кг", image: "arbuz"), ProductModel(price: 43.90, dimension: "100г", image: "bliny"), ProductModel(price: 74.90, dimension: "шт", image: "kvas"), ProductModel(price: 279.90, dimension: "шт", image: "pringles"), ProductModel(price: 109.90, dimension: "шт", image: "moloko_sg"), ProductModel(price: 109.90, dimension: "шт", image: "hrutka"), ProductModel(price: 129.90, dimension: "шт", image: "moloko"), ProductModel(price: 89.90, dimension: "100г", image: "syr"), ProductModel(price: 119.90, dimension: "100г", image: "kolbasa"),]
    
    private let insets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    private let minimumLineSpacing: CGFloat = 20.0
   
    private let productCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: ProductCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productCollectionView)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        productCollectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductCollectionViewCell.identifier, for: indexPath) as! ProductCollectionViewCell
        cell.configure(with: productData[indexPath.row])
       
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.2
        cell.layer.shadowOffset = CGSize(width: 0, height: 0)
        cell.layer.shadowRadius = 5.0
        cell.layer.cornerRadius = 15
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (contentView.frame.width - minimumLineSpacing*2) / 2.5
        let height = width*1.25
        print("recommended height: \(height)")
        return CGSize(width: width, height: height)
    }
    
    

}
