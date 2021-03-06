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
        if self.cards.isEmpty {
          self.searchView.collectionView.backgroundView = EmptyView(title: "Error", message: "Unable to load flash cards")
        } else {
          self.searchView.collectionView.backgroundView = nil
        }
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

extension SearchViewController : CardCellDelegate {
  func addButtonPressed(_ cell: CardCell, card: Cards) {
    print("add button pressed")
    if dataPersistence.hasItemBeenSaved(card) {
      showAlert(title: "Error", message: "Card has already been saved")
    } else {
      
      do {
        try dataPersistence.createItem(card)
        showAlert(title: "Success", message: "Flash card saved!")
      } catch {
        showAlert(title: "Failure", message: "Unable to save flash card. Try Again.")
      }
      print("saved")
    }
  }
}

extension SearchViewController : UISearchBarDelegate {
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    guard !searchText.isEmpty else {
      searchCards()
      return
    }
    cards = cards.filter {
      $0.quizTitle!.lowercased().contains(searchText.lowercased())
    }
    
    
  }
}

extension SearchViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let card = cards[indexPath.row]
    let viewController = FactsViewController()
    viewController.facts = card.facts!
    
    navigationController?.pushViewController(viewController, animated: true)
    
  }
}
