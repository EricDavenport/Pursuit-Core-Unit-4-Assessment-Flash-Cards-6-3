//
//  CardCellCollectionViewCell.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

protocol CardCellDelegate: AnyObject {
  func addButtonPressed(_ cell: CardCell, card: Cards )
}

class CardCell: UICollectionViewCell {
  
  weak var delegate: CardCellDelegate?
  private var currentCard: Cards!
  
  public lazy var titleLabel : UILabel = {
    let label = UILabel()
    label.text = "Card Title Here"
    label.backgroundColor = .systemTeal
    label.textAlignment = .center
    label.numberOfLines = 0
    return label
  }()
  
  public lazy var addButton : UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "rectangle.stack.badge.plus"), for: .normal)
    button.addTarget(self, action: #selector(addPressed(_:)), for: .touchUpInside)
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
    titleLabel.text = card.quizTitle
    currentCard = card
  }
  
  private func commonInit() {
    setupAddButton()
    titleLabelSetup()
  }
  
  @objc private func addPressed(_ sender: UIButton) {
    delegate?.addButtonPressed(self, card: currentCard)
  }
  
  private func setupAddButton() {
    addSubview(addButton)
    addButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      addButton.topAnchor.constraint(equalTo: topAnchor, constant: 8),
      addButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    ])
  }
  
  private func titleLabelSetup() {
    addSubview(titleLabel)
    titleLabel.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
      titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
      titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
      titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8)
    ])
  }
  

}
