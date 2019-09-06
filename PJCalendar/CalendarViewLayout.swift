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

  let shrinkableHeightRation: CGFloat = 3.0

  var attributes = [UICollectionViewLayoutAttributes]()

  override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
    return true
  }

  override func invalidateLayout() {
    super.invalidateLayout()
    self.attributes.removeAll()
  }

  func getSmallHeaderContentOffet() -> CGFloat {

    guard let collectionView = self.collectionView else { return 0 }

    var i: CGFloat = 0
    var size = HeaderCell.hearderheight

    while size >= HeaderCell.minHeaderSize {
      let avancement = i / (collectionView.frame.size.height / self.shrinkableHeightRation)
      size = HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight)
      i += 1
    }
    return i
  }

  private func getHeaderFrame(contentOffset: CGPoint) -> CGRect {
    guard
      let frame = self.collectionView?.frame,
      let contentOffset = self.collectionView?.contentOffset
      else { return .zero }


    let avancement = contentOffset.y / (frame.size.height / self.shrinkableHeightRation)
    let headerSize = HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight)

    guard headerSize >= HeaderCell.minHeaderSize else {

      return CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.minHeaderSize)
    }

    return CGRect(x: 0, y: contentOffset.y, width: frame.size.width, height: HeaderCell.hearderheight - (avancement * HeaderCell.hearderheight))
  }

  var cellHeaderFrame: CGRect {
      guard let collectionView = self.collectionView else { return .zero }
      return CGRect(x: 0, y: HeaderCell.hearderheight, width: collectionView.frame.width, height: 88)
  }

  var cellSize: CGSize {
    guard let collectionView = self.collectionView else { return .zero }
    if collectionView.traitCollection.horizontalSizeClass == .regular && collectionView.traitCollection.verticalSizeClass == .regular {
      return SlotCell.iPadCellSize
    } else {
      return SlotCell.cellSize
    }
  }

  var cellSpacing: CGFloat {
    guard let collectionView = self.collectionView else { return 0 }
    let totalElemSizeSpacingIncluded = collectionView.frame.size.width / 3
    return (totalElemSizeSpacingIncluded - self.cellSize.width)
  }

  private func getCellFrameFor(indexPath: IndexPath) -> CGRect {

    let (line, posInLine) = indexPath.item.quotientAndRemainder(dividingBy: 3)

    let smallSpacing =  self.cellSpacing / 2.0

    return CGRect(x: self.cellSpacing + (self.cellSize.width + smallSpacing) * CGFloat(posInLine),
                  y: HeaderCell.hearderheight + self.cellHeaderFrame.height + (CGFloat(line) * (self.cellSize.height + 16)),
                  width: self.cellSize.width,
                  height: self.cellSize.height)
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

  func addScrolableContentOffsetIfNeeded(size: CGSize) -> CGSize {
    guard let collectionView = self.collectionView else { return size }
    if size.height < collectionView.frame.height + self.getSmallHeaderContentOffet() {
      return CGSize(width: size.width, height: (collectionView.frame.height + self.getSmallHeaderContentOffet()))
    } else {
      return size
    }
  }

  override var collectionViewContentSize: CGSize {
    guard let collectionView = self.collectionView else { return .zero }

    guard collectionView.numberOfSections > 1 else {
      let dest = CGSize(width: collectionView.frame.size.width, height: HeaderCell.hearderheight)
      return self.addScrolableContentOffsetIfNeeded(size: dest)
    }

    if collectionView.numberOfItems(inSection: 1) == 0 {
      let dest = CGSize(width: collectionView.frame.size.width, height: (HeaderCell.hearderheight) + 88)
      return self.addScrolableContentOffsetIfNeeded(size: dest)
    }

    let lastIndexPath = IndexPath(item: collectionView.numberOfItems(inSection: 1) - 1, section: 1)

    let lastCellFrame = self.getCellFrameFor(indexPath: lastIndexPath)

    return self.addScrolableContentOffsetIfNeeded(size: CGSize(width: collectionView.frame.size.width, height: lastCellFrame.maxY + 16))
  }

}
