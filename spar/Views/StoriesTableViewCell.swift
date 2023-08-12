//
//  StoriesTableViewCell.swift
//  spar
//
//  Created by Admin on 12.08.2023.
//

import UIKit

class StoriesTableViewCell: UITableViewCell {
    
    static let identifier = "StoriesTableViewCell"
    
    private var storiesDataSource = [StoryModel(imageName: "spar_logo", text: "Привилегии Мой Спар"), StoryModel(imageName: "social_seti", text: "Мы в соцсетях"), StoryModel(imageName: "novinki_nedeli", text: "Новинки недели"), StoryModel(imageName: "recept_nedeli", text: "Рецепт недели"), StoryModel(imageName: "rospis", text: "Городецкая роспись"), StoryModel(imageName: "bonusi", text: "100000 бонусов")]
    
    private let storiesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 80, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: StoriesCollectionViewCell.identifier)
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(storiesCollectionView)
        storiesCollectionView.delegate = self
        storiesCollectionView.dataSource = self
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        storiesCollectionView.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

extension StoriesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        storiesDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoriesCollectionViewCell.identifier, for: indexPath) as! StoriesCollectionViewCell
        cell.configure(with: storiesDataSource[indexPath.row])
       return cell
    }
}
