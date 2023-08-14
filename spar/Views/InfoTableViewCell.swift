//
//  InfoTableViewCell.swift
//  spar
//
//  Created by Admin on 13.08.2023.
//

import UIKit

class InfoTableViewCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    static let identifier = "InfoTableViewCell"
    
    private let infoData = ["abonement", "dostavka_chas", "karta", "magaziny", "moya_skidka", "spar_wine", "spisok", "svyaz", "zakazhi_zaberi"]
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(infoCollectionView)
        infoCollectionView.delegate = self
        infoCollectionView.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        infoCollectionView.frame = contentView.bounds
    }
    
    private let lineSpacing: CGFloat = 15.0
    
    private let insets = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    
    private let infoCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return infoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.identifier, for: indexPath) as! InfoCollectionViewCell
        cell.configure(with: infoData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return insets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfItems: CGFloat = 3
        let width = (contentView.frame.width - (numberOfItems - 1)*lineSpacing - insets.left*2)/numberOfItems
        let height = width*1.25
        print("info height: \(height)")
        return CGSize(width: width, height: height)
    }
    

}
