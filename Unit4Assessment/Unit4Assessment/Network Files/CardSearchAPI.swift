//
//  CardSearchAPI.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation
import NetworkHelper

struct CardSearchAPI {
  static func getCards(for query: String, completion: @escaping (Result<[Cards], AppError>) -> ()) {
    let endpointString = "https://5daf8b36f2946f001481d81c.mockapi.io/api/v2/cards"
    
    guard let url = URL(string: endpointString) else {
      completion(.failure(.badURL(endpointString)))
      return
    }
    let request = URLRequest(url: url)
    
    NetworkHelper.shared.performDataTask(with: request) { (result) in
      switch result {
      case .failure(let appError):
        completion(.failure(.networkClientError(appError)))
      case .success(let data):
        do {
          let cards = try JSONDecoder().decode(CardSearch.self, from: data)
          completion(.success(cards.cards))
        } catch {
          completion(.failure(.decodingError(error)))
        }
      }
    }
    
    
  }
  
  
}