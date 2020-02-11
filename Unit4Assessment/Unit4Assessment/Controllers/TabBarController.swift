//
//  TabBarController.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  
  private lazy var cardVC: CardViewController = {
    let vc = CardViewController()
    vc.tabBarItem = UITabBarItem(title: "Cards", image: UIImage(systemName: "questionmark.diamond"), selectedImage: UIImage(systemName: "questionmark.diamond.fill"))
    return vc
  }()
  
  private lazy var createVC: CreateViewController = {
    let vc = CreateViewController()
    vc.tabBarItem = UITabBarItem(title: "Create", image: UIImage(systemName: "pencil.circle"), selectedImage: UIImage(systemName: "pencil.circle.fill"))
    return vc
  }()
  
  private lazy var searchVC: SearchViewController = {
    let vc = SearchViewController()
    vc.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), selectedImage: UIImage(systemName: "magnifyingglass.circle.fill"))
    return vc
  }()

    override func viewDidLoad() {
        super.viewDidLoad()

      viewControllers = [UINavigationController(rootViewController: cardVC), UINavigationController(rootViewController: createVC), UINavigationController(rootViewController: searchVC)]
    }
    


}
