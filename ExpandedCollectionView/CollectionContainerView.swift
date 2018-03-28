//
//  CollectionContainerView.swift
//  ExpandedCollectionView
//
//  Created by Seiya Mogami on 2018/03/28.
//  Copyright © 2018年 SeiyaMogami. All rights reserved.
//

import UIKit

class CollectionContainerView: UIView {
    @IBOutlet weak var collectionView: UICollectionView!

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        guard self.bounds.contains(point) else {
            return super.hitTest(point, with: event)
        }

        let updatedPoint = CGPoint(x: point.x, y: collectionView.frame.origin.y + collectionView.frame.height / 2)
        return super.hitTest(updatedPoint, with: event)
    }
}
