//
//  ScoreController.swift
//  DeckofOneCard
//
//  Created by Thomas Cowern New on 1/10/19.
//  Copyright © 2019 Jack Knight. All rights reserved.
//

import Foundation

class ScoreController {
    
    // MARK: - Singleton
    static let shared = ScoreController()
    
    // MARK: - Properties
    // User chosen guess
    var userChoice: Int = 0
    
    // Initializing score variable
    var score: Int = 0
    
    // Initializing strikes variable
    var strikes: Int = 0
    
    // Initializing array of stored scores
    var scores: [Int] = [4, 8]
    
    // Initializing high score variable
    var highScore: Int = 0

    // Function to add one point to current score
    func addOnePoint() {
        score += 1
    }
    
    // Function to add one strike to current strike count
    func addOneStrike() {
        strikes += 1
    }
    
    // Function to reset score
    func resetScore() {
        score = 0
        strikes = 0
    }
    
    // Function to check strikes, update score, and add new highscore
    func checkScore(score: Int, strikes: Int) {
        print("Score: \(score) Strikes: \(strikes)")
        if strikes >= 3 {
            print("You're out")
            scores.append(score)
            print("Scores: \(scores)")
            scores.sort()
            print("Sorted scores: \(scores)")
            highScore = scores.last ?? 0
            print("High Score: \(highScore)")
        } else {
            // Continue playing
        }
    }
}
