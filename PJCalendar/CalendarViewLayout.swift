//
//  CalendarViewLayout.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 07/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class CalendarFlowLayout: UICollectionViewFlowLayout {

  let shrinkableHeightRation: CGFloat = 3.0

  private func getHeaderFrame(contentOffset: CGPoint) -> CGRect? {
    guard
      let frame = self.collectionView?.frame,
      let contentOffset = self.collectionView?.contentOffset, contentOffset.y > 0  else { return nil}

    let avancement = contentOffset.y / (frame.size.height / self.shrinkableHeightRation)
    let headerSize = HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight)
    guard headerSize >= HeaderCell.minHeaderSize else { return CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.minHeaderSize) }

    return CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
  }

  func configureHeaderAttribute(attribute: UICollectionViewLayoutAttributes) {
    guard
      let contentOffset = self.collectionView?.contentOffset,
      let destHeaderFrame = self.getHeaderFrame(contentOffset: contentOffset) else { return }

    attribute.frame = destHeaderFrame
  }

  override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    guard let dest = super.layoutAttributesForSupplementaryView(ofKind: elementKind, at: indexPath), elementKind == UICollectionView.elementKindSectionHeader else { return nil }
    self.configureHeaderAttribute(attribute: dest)
    return dest
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let dest = super.layoutAttributesForElements(in: rect) else { return nil }
    guard let headerLayout = (dest.lazy.filter { ($0.representedElementKind == UICollectionView.elementKindSectionHeader) }).first else { return dest }
    self.configureHeaderAttribute(attribute: headerLayout)
    return dest
  }
}
