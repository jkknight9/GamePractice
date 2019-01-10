//
//  CardController.swift
//  DeckofOneCard
//
//  Created by Jack Knight on 12/17/18.
//  Copyright © 2018 Jack Knight. All rights reserved.
//

import UIKit

class CardController {
    
    //CRUD
    //URL
    private static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/")
    
    static func drawCard(numberOfCards: Int, completion: @escaping ((_ cards: [Card]) -> Void)) {
        // First get the url
        guard let url = self.baseURL else {fatalError("URL optional is nil")}
        // missing the count of cards to return
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        let cardCountQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        components?.queryItems = [cardCountQueryItem]
        
        print("For testing here is the complete URL - \(components?.url)")
        
        guard let requestURL = components?.url else {return}
        
        //Get the data
        var request = URLRequest(url: requestURL)
       request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { (data, _, error) in
            do {
                if let error = error { throw error}
                guard let data = data else {throw NSError()}
              
                //decode
                let jsonDecoder = JSONDecoder()
               let deck = try! jsonDecoder.decode(TopLevelDictionary.self, from: data)
                completion(deck.cards)
            } catch {
                print("Error retrieving cards from \(requestURL)")
                completion([])
                return
            }
        }
        dataTask.resume()
    
    
    /////// old and busted
    }
    //  static func drawCard() -> Card? {
    //        // First, get the url
    //        guard let url = baseURL else {return nil}
    //        //Then access the contents of that url
    //        let data =  try! Data(contentsOf: url)
    //        //decode the data
    //       let jsonDecoder = JSONDecoder()
    //        let deck =  try! jsonDecoder.decode(TopLevelDictionary.self, from: data)
    //        // return our card
    //        return deck.cards[0]
    //    }
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: url) else { return }
        let dataTask = URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data,
                let image = UIImage(data: data) else {
                    DispatchQueue.main.async {completion(nil)}
                    return
            }
            DispatchQueue.main.async {completion(image)}
        }
        dataTask.resume()
    }
} // End of Class


//    static func getImage(_ cardImageURL: String) -> UIImage? {
//        guard let urlForImage = URL(string: cardImageURL) else {return nil}
//        let imageData = try! Data(contentsOf: urlForImage)
//        let cardImage = UIImage(data: imageData)
//        return cardImage
//
//    }
