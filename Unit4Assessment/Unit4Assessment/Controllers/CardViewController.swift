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
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return savedCards.count
  }
}

extension CardViewController : UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let card = savedCards[indexPath.row]
    let viewController = FactsViewController()
    viewController.facts = card.facts
//    viewController.dataPersistence = dataPersistence
    navigationController?.pushViewController(viewController, animated: true)
    
  }
}



//func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//   let article = newsArticles[indexPath.row]
//   let articleDVC = ArticleDetailViewController()
//   // TODO: after assessement we will be using initializers as dependency injection mechanisms
//   articleDVC.article = article
//
//   // step 3: setting up data persistence and its delegate
//   articleDVC.dataPersistence = dataPersistence
//   navigationController?.pushViewController(articleDVC, animated: true)
// }
