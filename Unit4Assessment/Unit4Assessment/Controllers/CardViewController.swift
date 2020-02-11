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
  
  override func loadView() {
    view = cardView
  }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
