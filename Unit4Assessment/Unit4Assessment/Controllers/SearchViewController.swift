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

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    searchCards()
  }
  
  override func loadView() {
    view = searchView
  }
  


    override func viewDidLoad() {
        super.viewDidLoad()
      searchView.collectionView.dataSource = self
      searchView.collectionView.delegate = self
      searchView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "searchCell")
//      searchCards()
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
    return cards.count
  }
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "searchCell", for: indexPath) as? CardCell else {
      fatalError("unable to downcast to card cell")
    }
    
    let card = cards[indexPath.row]
    cell.backgroundColor = .white
    cell.configureCell(with: card)
    return cell
  }
}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
  
}
