//
//  CreateView.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CreateView: UIView {
  
  public lazy var titleTextField : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Flash Card title"
    tf.textColor = .white
    tf.textAlignment = .center
    tf.backgroundColor = .systemGray3
    return tf
  }()
  
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.textAlignment = .left
    label.text = "Card Title"
    return label
  }()
  
  public lazy var firstHint : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Hint one here"
    tf.textColor = .white
    tf.textAlignment = .center
    tf.backgroundColor = .systemGray3
    return tf
  }()
  
  public lazy var firstHintLabel : UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "Hint 1"
    return label
  }()
  
  public lazy var secondHintLabel : UILabel = {
    let label = UILabel()
    label.textColor = .black
    label.text = "Hint 2"
    return label
  }()
  
  
  public lazy var secondHint : UITextField = {
    let tf = UITextField()
    tf.placeholder = "Hint two here"
    tf.textColor = .white
    tf.textAlignment = .center
    tf.backgroundColor = .systemGray3
    return tf
  }()

 
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    titleLabelConstraints()
    titleFieldContraints()
    firstHintConstraints()
    secondHintConstraints()
  }
  
  private func titleLabelConstraints() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      titleLabel.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func titleFieldContraints() {
    addSubview(titleTextField)
    titleTextField.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      titleTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      titleTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      titleTextField.heightAnchor.constraint(equalToConstant: 20)
    ])
  }
  
  private func firstHintConstraints() {
    addSubview(firstHint)
    firstHint.translatesAutoresizingMaskIntoConstraints = false
//    firstHint.heightAnchor.constraint(equalToConstant: 100).isActive = true

    NSLayoutConstraint.activate([
      firstHint.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
      firstHint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      firstHint.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      firstHint.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.30)
    ])
  }
  
  private func secondHintConstraints() {
    addSubview(secondHint)
    secondHint.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      secondHint.topAnchor.constraint(equalTo: firstHint.bottomAnchor, constant: 20),
      secondHint.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
      secondHint.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
      secondHint.heightAnchor.constraint(equalTo: firstHint.heightAnchor)
    ])
  }
  


}
