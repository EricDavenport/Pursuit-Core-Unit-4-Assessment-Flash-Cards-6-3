//
//  EmptyView.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/12/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class EmptyView: UIView {
  
  public lazy var headerLabel : UILabel = {
    let label = UILabel()
    label.text = "No cards saved"
    label.textAlignment = .center
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    return label
  }()
  
  public lazy var subHeaderLabel : UILabel = {
    let label = UILabel()
    label.text = "Create or save a card"
    label.textAlignment = .center
    label.font = UIFont.preferredFont(forTextStyle: .subheadline)
    label.backgroundColor = .darkGray
    return label
  }()
  
  
  
  init(title: String, message: String) {
    super.init(frame: UIScreen.main.bounds)
    headerLabel.text = title
    subHeaderLabel.text = message
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    headerLabelConstraints()
  }
  
  private func headerLabelConstraints() {
    addSubview(headerLabel)
    headerLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      headerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      headerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      headerLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      headerLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    ])
    
  }
  
  private func subHeaderLabelConstraints() {
    addSubview(subHeaderLabel)
    subHeaderLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
    subHeaderLabel.bottomAnchor.constraint(equalTo: headerLabel.topAnchor, constant: -8),
    subHeaderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
    subHeaderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    ])
  }
  
  
  
}
