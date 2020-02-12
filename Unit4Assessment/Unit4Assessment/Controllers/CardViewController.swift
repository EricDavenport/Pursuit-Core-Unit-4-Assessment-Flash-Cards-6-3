//
//  CardViewController.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import  DataPersistence

class CardViewController: UIViewController {
  
  private let cardView = CardView()
  
  public var dataPersistence : DataPersistence<Cards>!
  
  private var savedCards = [Cards]() {
    didSet {
      DispatchQueue.main.async {
        self.cardView.collectionView.reloadData()
        if self.savedCards.isEmpty {
          self.cardView.collectionView.backgroundView = EmptyView(title: "Saved Cards", message: "No cards saved. Create using the middle icon.")
        } else {
          self.cardView.collectionView.backgroundView = nil
        }
      }
    }
  }
  
  
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(true)
    loadSavedCards()
  }
  override func loadView() {
    view = cardView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      cardView.collectionView.dataSource = self
      cardView.collectionView.delegate = self
      cardView.collectionView.register(CardCell.self, forCellWithReuseIdentifier: "cardCell")
      
      loadSavedCards()
    }
  
  private func loadSavedCards() {
    do {
      savedCards = try dataPersistence.loadItems()
    } catch {
      showAlert(title: "Error", message: "Issue loading saved flash cards")
    }
  }
    
}

extension CardViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cardCell", for: indexPath) as? CardCell else {
      fatalError("failed to downcast in CardViewCOntroller")
    }
    
    let card = savedCards[indexPath.row]
    
    cell.configureCell(with: card)
    cell.backgroundColor = .brown
    cell.delegate = self
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return savedCards.count
  }
  
  private func deleteCard(_ card: Cards) {
    guard let index = savedCards.firstIndex(of: card) else {
      return
    }
    do {
      try dataPersistence.deleteItem(at: index)
      loadSavedCards()
    } catch {
      loadSavedCards()
    }
  }


}

extension CardViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let card = savedCards[indexPath.row]
    let viewController = FactsViewController()
    viewController.facts = card.facts!
    navigationController?.pushViewController(viewController, animated: true)
    
  }
}

extension CardViewController : CardCellDelegate {
func addButtonPressed(_ cell: CardCell, card: Cards) {
  print("delete button pressed")
  
  let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
  let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
  let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (action) in
    self.deleteCard(card)
  }
  
  alertController.addAction(cancelAction)
  alertController.addAction(deleteAction)
  present(alertController, animated: true)
   

}
}



