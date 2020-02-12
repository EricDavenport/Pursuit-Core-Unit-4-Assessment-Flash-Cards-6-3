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
//  public var newCard: Cards?
  
  
  override func loadView() {
    view = createView
  }

    override func viewDidLoad() {
        super.viewDidLoad()
      createView.firstHint.delegate = self
      createView.secondHint.delegate = self
      createView.titleTextField.delegate = self
      view.backgroundColor = .systemGroupedBackground
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(createButtonPressed))
      
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
      
    }
  
  
  @objc private func cancelButtonPressed() {
    print("cancel")
//    resignFirstResponder()
    clearAll()
  }
  
  @objc private func createButtonPressed() {
    var thisCard = Cards(id: "", quizTitle: "", facts: [""])
    
    
    if (createView.titleTextField.text == nil || createView.firstHint.text == nil || createView.secondHint.text == nil) || (thisCard.quizTitle == "" || thisCard.facts == [""] ) {
      showAlert(title: "All Fields Required", message: "Please fill in all fields.")
    } else {
      thisCard.quizTitle = createView.titleTextField.text
      thisCard.facts?.append(createView.firstHint.text!)
      thisCard.facts?.append(createView.secondHint.text!)
      do {
        try dataPersistence.createItem(thisCard)
        showAlert(title: "Success", message: "Flash card created")
      } catch {
        showAlert(title: "Failure", message: "Unable to create card")
      }
    }
    
    print("create")
  }
  
  
  
  private func clearAll() {
    let alertController = UIAlertController(title: "Are your sure", message: "All data inputted will be removed", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let okAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
      self.createView.titleTextField.text = nil
      self.createView.firstHint.text = nil
      self.createView.secondHint.text = nil
    }
    alertController.addAction(cancelAction)
    alertController.addAction(okAction)
    
    present(alertController, animated: true)
    
  }

}

extension CreateViewController : UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    resignFirstResponder()
  }
}
