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
    cell.backgroundColor = .systemOrange
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return savedCards.count
  }
}
