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
  
  public lazy var hintView : UILabel = {
    let label = UILabel()
    label.text = "hint"
    label.backgroundColor = .orange
    label.isHidden = true
    return label
  }()
  
  private lazy var doubleTapGesture: UITapGestureRecognizer = {
    let gesture = UITapGestureRecognizer()
    gesture.numberOfTapsRequired = 2
    gesture.addTarget(self, action: #selector(gestureAction))
    return gesture
  }()
  
  private var hintsVisible = false
    
  override init(frame: CGRect) {
    super.init(frame: UIScreen.main.bounds)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }

  
  private func commonInit() {
    setupAddButton()
    titleLabelSetup()
    hintLabelSetup()
    addGestureRecognizer(doubleTapGesture)
    self.isUserInteractionEnabled = true
  }
  
  @objc private func gestureAction() {
    hintsVisible.toggle()
    animate()
  }
  
  private func animate() {
    
    if hintsVisible {
      UIView.transition(with: self, duration: 0.8, options: [.transitionFlipFromLeft], animations: {
        self.hintView.isHidden = false
        self.titleLabel.isHidden = true
      }, completion: nil)
    } else {
      UIView.transition(with: self, duration: 0.8, options: [.transitionFlipFromRight], animations: {
        self.hintView.isHidden = true
        self.titleLabel.isHidden = false
      }, completion: nil)
    }
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
  
  private func hintLabelSetup() {
    addSubview(hintView)
    hintView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      hintView.topAnchor.constraint(equalTo: addButton.bottomAnchor),
      hintView.centerXAnchor.constraint(equalTo: centerXAnchor),
      hintView.centerYAnchor.constraint(equalTo: centerYAnchor),
      hintView.leadingAnchor.constraint(equalTo: leadingAnchor),
      hintView.trailingAnchor.constraint(equalTo: trailingAnchor),
      hintView.heightAnchor.constraint(equalToConstant: 75)
    ])
  }
  
  public func configureCell(with card: Cards) {
    titleLabel.text = card.quizTitle
    hintView.text = card.facts[0]
    currentCard = card
  }

}
