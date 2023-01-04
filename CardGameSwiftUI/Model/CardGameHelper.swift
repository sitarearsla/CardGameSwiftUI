//
//  CardGameHelper.swift
//  CardGame
//
//  Created by Gun Makinabakan on 17.10.2022.
//

class CardGameHelper {
    
    private var deck: [Card] = []
    weak var delegate: CardGameDelegate?
    
    init() {
        initializeAndShuffleDeck()
    }
    
    private func initializeAndShuffleDeck() {
        deck.removeAll(keepingCapacity: true)
        for i in 1...13 {
            if i == 1 {
                let card = Card(faceValue: 14, imageName: "card\(i)")
                deck.append(card)
            } else {
                let card = Card(faceValue: i, imageName: "card\(i)")
                deck.append(card)
            }
        }
        
        deck.shuffle()
    }
    
    func drawACard() -> Card? {
        if deck.count == 1 {
            initializeAndShuffleDeck()
            delegate?.resetUI()
            return nil
        } else if deck.count == 2 {
            delegate?.getReadyForShuffle()
        }
        return deck.removeFirst()
    }
    
    func decideWinner(card1: Card, card2: Card) -> String {
        if card1.faceValue > card2.faceValue {
            return "Player 1 WINSSS!!!"
        }
        return "Player 2 WINSSS!!!"
    }
}
