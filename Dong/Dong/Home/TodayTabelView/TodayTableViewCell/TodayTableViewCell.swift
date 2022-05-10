//
//  TodayTableViewCell.swift
//  Dong
//
//  Created by Dong Duong V. on 5/5/22.
//

import UIKit

class TodayTableViewCell: UITableViewCell {
    
    var menusRes: [Restaurant] = []
    
    @IBOutlet weak var collectionToday: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configToday()
    }
   
    func reloadData(){
        collectionToday.reloadData()
    }
    
    func configToday(){
        let cell = UINib(nibName: "CustomCollection", bundle: nil)
        collectionToday.register(cell, forCellWithReuseIdentifier: "CustomCollection")
        collectionToday.dataSource = self
        collectionToday.delegate = self
    }
}

extension TodayTableViewCell: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menusRes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollection", for: indexPath) as? CustomCollection else {
            return UICollectionViewCell()
        }

        cell.updateToday(image: menusRes[indexPath.row].photos.first ?? "", name: menusRes[indexPath.row].name, address: menusRes[indexPath.row].address.address)
     return cell
    
}
}

extension TodayTableViewCell : UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return  CGSize(width: 150, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 0)
    }
    
}
