//
//  FactsViewController.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class FactsViewController: UIViewController {
  
  private let factsView = FactView()
  
  public var dataPersistence : DataPersistence<Cards>!
  
  public var facts = [String]() {
    didSet {
      self.factsView.collectionView.reloadData()
    }
  }
  
  override func loadView() {
    view = factsView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      factsView.collectionView.dataSource = self
      factsView.collectionView.register(FactsCell.self, forCellWithReuseIdentifier: "factsCell")
    }
  

}

extension FactsViewController : UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return facts.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "factsCell", for: indexPath) as? FactsCell else {
      fatalError("unable to downcast to FactsCell")
    }
    let hint = facts[indexPath.row]
    
    cell.currentHint = hint
    cell.backgroundColor = .white
    cell.configureCell(hint, number: (indexPath.row))
    
    return cell
  }
}
