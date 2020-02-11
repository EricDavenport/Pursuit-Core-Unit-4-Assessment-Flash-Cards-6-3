//
//  FactsCell.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class FactsCell: UICollectionViewCell {
  
  public var currentHint: String!
    
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.textAlignment = .center
    label.text = "Hint 1"
    return label
  }()
  
  public lazy var hintLabel : UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.text = "Hint details"
    return label
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
    hintLabelContraints()
  }

  
  private func titleLabelConstraints() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      titleLabel.heightAnchor.constraint(equalToConstant: 35)
    ])
  }
  
  private func hintLabelContraints() {
    addSubview(hintLabel)
    hintLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hintLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
      hintLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10),
      hintLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
      hintLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
    ])
  }
  
  public func configureCell(_ hints: String) {
    hintLabel.text = currentHint
  }
}
