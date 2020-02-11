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
      view.backgroundColor = .systemGroupedBackground
      navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Create", style: .done, target: self, action: #selector(createButtonPressed))
      
      navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelButtonPressed))
      
    }
  
  
  @objc private func cancelButtonPressed() {
    print("cancel")
    clearAll()
  }
  
  @objc private func createButtonPressed() {
    let thisCard = Cards(id: "", quizTitle: (createView.titleTextField.text)!, facts: [createView.firstHint.text!, createView.secondHint.text!])
        
    if createView.firstHint.text != nil && createView.titleLabel.text != nil {
    do {
      if createView.firstHint.text != nil && createView.titleLabel.text != nil {
    try dataPersistence.createItem(thisCard)
      showAlert(title: "Success", message: "Flash card saved!")
      } else {
        if createView.firstHint.text == nil {
        showAlert(title: "Failure", message: "At least 1 Hint Required")
        } else if createView.titleTextField.text == nil {
          showAlert(title: "Failure", message: "Title Required")
        }
      }
    } catch {
      showAlert(title: "Failure", message: "Unable to save flash card. Try Again.")
    }
    }
    print("create")
  }
  
  
  
  private func clearAll() {
    let alertController = UIAlertController(title: "Are your sure", message: "All data inputted will be removed", preferredStyle: .alert)
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
    let okAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
      self.createView.titleTextField.text = ""
      self.createView.firstHint.text = ""
      self.createView.secondHint.text = ""
    }
    alertController.addAction(cancelAction)
    alertController.addAction(okAction)
    
    present(alertController, animated: true)
    
  }

}
