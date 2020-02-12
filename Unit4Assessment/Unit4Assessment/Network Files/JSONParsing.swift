//
//  JSONParsing.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

public enum ParsingServiceError: Error {
  case resourcePathDoesNotExist
  case contentsNotFound
  case decodingError(Error)
}
final class ParsingService {
  public static func loadFlashCards() throws -> [Cards] {
    guard let path = Bundle.main.path(forResource: "FlashCards", ofType: "json") else {
      throw ParsingServiceError.resourcePathDoesNotExist
    }
    guard let json = FileManager.default.contents(atPath: path) else {
      throw ParsingServiceError.contentsNotFound
    }
    do {
      let stocks = try JSONDecoder().decode([Cards].self, from: json)
      //      let results = stocks.cards
      return stocks
    } catch {
      throw ParsingServiceError.decodingError(error)
    }
  }
}
