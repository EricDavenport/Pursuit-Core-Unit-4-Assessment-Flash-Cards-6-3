//
//  SearchView.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class SearchView: UIView {
  
  public lazy var searchBar: UISearchBar = {
    let sb = UISearchBar()
    sb.placeholder = "search cards"
    sb.backgroundColor = .systemGroupedBackground
    return sb
  }()
  
  public lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    layout.itemSize = CGSize(width: 200, height: UIScreen.main.bounds.size.height * 0.35)
    let cv = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
    cv.backgroundColor = .systemGroupedBackground
    return cv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    searchBarSetup()
    collectionViewSetup()
  }
  
  private func searchBarSetup() {
    addSubview(searchBar)
    searchBar.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      searchBar.leadingAnchor.constraint(equalTo: leadingAnchor),
      searchBar.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  private func collectionViewSetup() {
    addSubview(collectionView)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
      collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
      collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }
  
  
}
