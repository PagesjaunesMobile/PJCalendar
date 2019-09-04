//
//  CalendarViewLayout.swift
//  PJCalendar
//
//  Created by Nicolas Bellon on 07/08/2019.
//  Copyright © 2019 Solocal. All rights reserved.
//

import Foundation
import UIKit

class NewCalendarFlowLayout: UICollectionViewLayout {

  let cellSize = SlotCell.cellSize

  let shrinkableHeightRation: CGFloat = 3.0
  var firstShoot: Bool = true
  var currentHeaderSize: CGSize = .zero

  var forceSmallHeader = false

  var attributes = [UICollectionViewLayoutAttributes]()

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

  override func invalidateLayout() {
    super.invalidateLayout()
    self.attributes.removeAll()
  }

  private func getHeaderFrame(contentOffset: CGPoint) -> CGRect {
    guard
      let frame = self.collectionView?.frame,
      let contentOffset = self.collectionView?.contentOffset,
      let collectionView = self.collectionView else { return .zero }


    guard self.forceSmallHeader == false else {
      return CGRect(x: 0, y: contentOffset.y, width: collectionView.frame.size.width, height: HeaderCell.minHeaderSize)
    }

    let avancement = contentOffset.y / (frame.size.height / self.shrinkableHeightRation)
    let headerSize = HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight)
    guard headerSize >= HeaderCell.minHeaderSize else {
      self.currentHeaderSize = CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.minHeaderSize).size
      return CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.minHeaderSize)
    }
    self.currentHeaderSize = CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight)).size
    return CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
  }

  var cellHeaderFrame: CGRect {
      guard let collectionView = self.collectionView else { return .zero }
    if self.forceSmallHeader == true {
      return CGRect(x: 0, y: HeaderCell.minHeaderSize, width: collectionView.frame.width, height: 88)
    } else {
      return CGRect(x: 0, y: HeaderCell.hearderheight, width: collectionView.frame.width, height: 88)
    }
  }

  var cellWidthSpaceIncluded: CGFloat {
    guard let collectionView = self.collectionView else { return 0 }
    let totalElemSizeSpacingIncluded = collectionView.frame.size.width / 3
    return totalElemSizeSpacingIncluded
  }

  private func getCellFrameFor(indexPath: IndexPath) -> CGRect {

    let (line, posInLine) = indexPath.item.quotientAndRemainder(dividingBy: 3)

    if self.forceSmallHeader == true {
      return CGRect(x: cellWidthSpaceIncluded * CGFloat(posInLine),
                    y: HeaderCell.minHeaderSize + self.cellHeaderFrame.height + (CGFloat(line) * (SlotCell.cellSize.height + 10)),
                    width: SlotCell.cellSize.width,
                    height: SlotCell.cellSize.height)

    }

    return CGRect(x: cellWidthSpaceIncluded * CGFloat(posInLine),
                  y: HeaderCell.hearderheight + self.cellHeaderFrame.height + (CGFloat(line) * (SlotCell.cellSize.height + 10)),
                  width: SlotCell.cellSize.width,
                  height: SlotCell.cellSize.height)
  }


  override func prepare() {

    guard let collectionView = self.collectionView else { return }

    self.attributes.removeAll()

    let headerAttributes = UICollectionViewLayoutAttributes(
      forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
      with: IndexPath(item: 0, section: 0))

    headerAttributes.frame = self.getHeaderFrame(contentOffset: collectionView.contentOffset)
    headerAttributes.zIndex = 1
    self.attributes.append(headerAttributes)

    if collectionView.numberOfSections > 1 {
      let headerCellAttributes = UICollectionViewLayoutAttributes(
          forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
          with: IndexPath(item: 0, section: 1))
      headerCellAttributes.frame = self.cellHeaderFrame
      self.attributes.append(headerCellAttributes)

      for i in 0..<collectionView.numberOfItems(inSection: 1) {
        let indexPath = IndexPath(item: i, section: 1)
        let cellAttribute = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        cellAttribute.frame = self.getCellFrameFor(indexPath: indexPath)
        cellAttribute.zIndex = 0
        
        self.attributes.append(cellAttribute)
      }
    }
  }

  override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    return attributes.filter { $0.frame.intersects(rect) }
  }

  override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return attributes.first { $0.indexPath == indexPath && $0.representedElementKind != UICollectionView.elementKindSectionHeader }
  }

  override func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
    return self.attributes.first { $0.indexPath.section == indexPath.section && $0.representedElementKind == elementKind }

  }

  override var collectionViewContentSize: CGSize {
    guard let collectionView = self.collectionView else { return .zero }

    guard collectionView.numberOfSections > 1 else {
      if self.forceSmallHeader == true {
        return CGSize(width: collectionView.frame.size.width, height: HeaderCell.minHeaderSize)
      } else {
      return CGSize(width: collectionView.frame.size.width, height: HeaderCell.hearderheight)
      }

    }

    if collectionView.numberOfItems(inSection: 1) == 0 {
      if self.forceSmallHeader == true {
      return CGSize(width: collectionView.frame.size.width, height: HeaderCell.minHeaderSize + 88)
      }
      return CGSize(width: collectionView.frame.size.width, height: HeaderCell.hearderheight + 88)
    }

    let lastIndexPath = IndexPath(item: collectionView.numberOfItems(inSection: 1) - 1, section: 1)

    let lastCellFrame = self.getCellFrameFor(indexPath: lastIndexPath)

    let dest = CGSize(width: collectionView.frame.size.width, height: lastCellFrame.maxY)

    return dest
  }

}
