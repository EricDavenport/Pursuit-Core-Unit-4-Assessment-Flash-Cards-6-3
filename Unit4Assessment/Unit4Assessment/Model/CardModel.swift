//
//  CardModel.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

//struct CardSearch : Codable & Equatable {
//  let cards : [Cards]
//}

struct Cards : Codable & Equatable {
  let id : String?
  let quizTitle : String
  let facts : [String]
}

