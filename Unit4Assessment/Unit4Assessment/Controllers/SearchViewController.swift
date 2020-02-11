//
//  SearchViewController.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class SearchViewController: UIViewController {
  
  private let searchView = SearchView()
  public var dataPersistence : DataPersistence<Cards>!
  
  private var cards = [Cards]() {
    didSet {
      DispatchQueue.main.async {
        self.searchView.collectionView.reloadData()
      }
    }
  }

  
  override func loadView() {
    view = searchView
  }
  


    override func viewDidLoad() {
        super.viewDidLoad()
      searchView.collectionView.dataSource = self
      searchView.collectionView.delegate = self
      searchView.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "searchCell")
      searchCards()
    }
  
  
  private func searchCards() {
    CardSearchAPI.getCards(for: "") { [weak self] (result) in
      switch result {
      case .failure(let appError):
        self?.showAlert(title: "Error", message: "Unable to load cards/n\(appError)")
      case .success(let cards):
        self?.cards = cards
      }
    }
  }

}

extension SearchViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 25
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath)
    
//    let card = cards[indexPath.row]
    cell.backgroundColor = .white
    
    return cell
  }
}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
  
}
