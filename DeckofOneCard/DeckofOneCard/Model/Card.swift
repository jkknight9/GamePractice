//
//  Card.swift
//  DeckofOneCard
//
//  Created by Jack Knight on 12/17/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import Foundation

struct TopLevelDictionary: Codable {
    let cards: [Card]
}

struct Card: Codable {
    let suit: String
    let value: String
    let image: String
}
