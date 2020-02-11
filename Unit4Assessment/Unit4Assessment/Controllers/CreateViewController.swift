//
//  CreateViewController.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit
import DataPersistence

class CreateViewController: UIViewController {
  
  private let createView = CreateView()
  public var dataPersistence : DataPersistence<Cards>!
  
  override func loadView() {
    view = createView
  }

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    

  
    

}
