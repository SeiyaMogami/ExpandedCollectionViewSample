//
//  ViewController.swift
//  ExpandedCollectionView
//
//  Created by Seiya Mogami on 2018/03/28.
//  Copyright © 2018年 SeiyaMogami. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var label: UILabel!

    private var contents = ["あいうえお", "かきくけこ", "さしすせそ", "たちつてと", "なにぬねの", "はひふへほ"]

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView.collectionViewLayout = layout
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.label.text = contents[indexPath.row]
        return cell
}

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        label.text = "didSelectItem: \(contents[indexPath.row])"
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
}

