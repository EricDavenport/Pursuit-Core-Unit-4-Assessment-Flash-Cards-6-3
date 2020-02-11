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
    searchView.searchBar.delegate = self
    searchView.collectionView.dataSource = self
    searchView.collectionView.delegate = self
    searchView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "searchCell")
          searchCards()
  }
  
  
  private func searchCards() {
    do {
      cards = try ParsingService.loadFlashCards()
    } catch {
      showAlert(title: "Unsuccessful", message: "Unable to load flash cards")
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
    cell.delegate = self
    return cell
  }
}

extension SearchViewController : UICollectionViewDelegate {
  
}

extension SearchViewController : CardCellDelegate {
  func addButtonPressed(_ cell: CardCell, card: Cards) {
    print("add button pressed")
    

      do {
      try dataPersistence.createItem(card)
        showAlert(title: "Success", message: "Flash card saved!")
      } catch {
        showAlert(title: "Failure", message: "Unable to save flash card. Try Again.")
      }
      print("saved")
    }

  }

extension SearchViewController : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard !searchText.isEmpty else {
      // if text is empty reload all the articles
      searchCards()
      return
    }
    cards = cards.filter {
      $0.quizTitle.lowercased().contains(searchText.lowercased())
    }
    
    // filter articles based on searchText
//    newsArticles = newsArticles.filter {
//      $0.title.lowercased().contains(searchText.lowercased()) }
//    print(searchText)
//    resignFirstResponder()
  }
}
