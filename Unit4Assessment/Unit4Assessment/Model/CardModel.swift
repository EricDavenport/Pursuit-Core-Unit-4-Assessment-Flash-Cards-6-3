//
//  CardModel.swift
//  Unit4Assessment
//
//  Created by Eric Davenport on 2/11/20.
//  Copyright © 2020 Alex Paul. All rights reserved.
//

import Foundation

struct CardSearch : Codable & Equatable {
  let cards : [Cards]
}

struct Cards : Codable & Equatable {
  let id : String
  let cardTitle : String
  let facts : [String]
}



//"id": "1",
//         "cardTitle": "What is the difference between a synchronous & an asynchronous task?",
//         "facts": [
//             "Synchronous: waits until the task have completed.",
//             "Asynchronous: completes a task in the background and can notify you when complete."
//         ]
