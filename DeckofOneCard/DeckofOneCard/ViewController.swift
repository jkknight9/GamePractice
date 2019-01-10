//
//  ViewController.swift
//  DeckofOneCard
//
//  Created by Jack Knight on 12/17/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var strikesLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var highscoreLabel: UILabel!
    @IBOutlet weak var drawCardButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var guessLabel: UILabel!
    
    var strikes: Int = 0
    var score: Int = 0
    var highscore: Int = 0
    var guess: Bool = false
    var newCardValue: String?
    var currentCardValue: String? {
        didSet {
            previousCardValue = oldValue
        }
    }
    var previousCardValue: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDard()
        designDrawButton()
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        drawDard()
    }
    
    @IBAction func lowerButtonTapped(_ sender: UIButton) {
        guard let cardValue = currentCardValue else { print(">>>>>>>\(#file) \(#function) \(#line): guard let failed <<<<<<<"); return }
        lower(cardValue: cardValue)
        updateViews()
    }
    
    @IBAction func higherButtonTapped(_ sender: UIButton) {
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
    }
    
    func designDrawButton() {
        drawCardButton.setBackgroundImage(UIImage(named: "Wood"), for: .normal)
        drawCardButton.layer.cornerRadius = drawCardButton.frame.height / 2
        drawCardButton.layer.borderColor = UIColor.black.cgColor
        drawCardButton.layer.borderWidth = 2
        drawCardButton.setTitle("Draw a new card", for: .normal)
        drawCardButton.setTitleColor(.white, for: .normal)
        //        drawCardButton.setImage(UIImage(named: "Wood"), for: .normal)
        drawCardButton.clipsToBounds = true
    }
    
    func drawDard() {
        CardController.fetchCard(numberOfCards: 1) { (cards) in
            let card = cards[0]
            self.currentCardValue = card.value
            CardController.fetchImage(forURL: card.image, completion: { (cardImage) in
                guard let image = cardImage else { return }
                DispatchQueue.main.async {
                    self.cardImageView.image = image
                }
            })
        }
    }
    
    func lower(cardValue: String) {
        drawDard()
        guard let currentValue = currentCardValue,
            let previousValue = previousCardValue,
            let current = CardScores.CardValues[currentValue],
            let previous = CardScores.CardValues[previousValue]
            else { print(">>>>>>>\(#file) \(#function) \(#line): guard let failed <<<<<<<"); return }
        if current < previous {
            guessLabel.text = "Good Guess"
            score += 1
        } else if current > previous {
            strikes += 1
        }
    }
    
    func updateViews() {
        scoreLabel.text = String(score)
        strikesLabel.text = String(strikes)
    }
        
}


//        let card = CardController.drawCard()
//        let image = CardController.getImage(card!.image)
//        cardImageView.image = image

