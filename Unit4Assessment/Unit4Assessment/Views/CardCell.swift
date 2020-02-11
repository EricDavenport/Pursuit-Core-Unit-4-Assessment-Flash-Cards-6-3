//
//  CardCellCollectionViewCell.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class CardCell: UICollectionViewCell {
  
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Card Title Here"
    label.backgroundColor = .systemTeal
    label.numberOfLines = 0
    return label
  }()
  
  public lazy var addButton : UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "rectangle.stack.badge.plus"), for: .normal)
    return button
  }()
    
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  public func configureCell(with card: Cards) {
    titleLabel.text = card.cardTitle
  }
  
  private func commonInit() {
    setupAddButton()
    titleLabelSetup()
  }
  
  private func setupAddButton() {
    addSubview(addButton)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      addButton.topAnchor.constraint(equalTo: topAnchor),
      addButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8)
    ])
  }
  
  private func titleLabelSetup() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -8),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8)
    ])
  }
  

}
