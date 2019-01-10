//
//  ViewController.swift
//  DeckofOneCard
//
//  Created by Jack Knight on 12/17/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var drawCardButton: UIButton!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        drawDard()
        designDrawButton()
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
        //        let card = CardController.drawCard()
        //        let image = CardController.getImage(card!.image)
        //        cardImageView.image = image
        
        CardController.drawCard(numberOfCards: 1) { (cards) in
            let card = cards[0]
            CardController.image(forURL: card.image, completion: { (cardImage) in
                guard let image = cardImage else { return }
                self.cardImageView.image = image
            })
        }
    }
    
    @IBAction func drawCardButtonTapped(_ sender: Any) {
        drawDard()
    }
}


