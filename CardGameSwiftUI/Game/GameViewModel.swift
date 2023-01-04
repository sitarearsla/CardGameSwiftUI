//
//  GameViewModel.swift
//  CardGameSwiftUI
//
//  Created by Sitare Arslanturk on 2.01.2023.
//

import SwiftUI

class GameViewModel: ObservableObject {
//    all business logic belongs to view model
//    any change on the object could be observed
//    any change will be redrawn
//    when published, the view updates
    private let cardGameHelper = CardGameHelper()
    @Published var player1ImageName = "back"
    @Published var player2ImageName = "back"
    @Published var gameStatusText = "Play the Game"
    @Published var playButtonText = "PLAY"
    
//    without it, no delegate to answer
    init() {
        cardGameHelper.delegate = self
    }
    
    func drawCards(){
        let card1 = cardGameHelper.drawACard()
        let card2 = cardGameHelper.drawACard()
        
        if let card1, let card2 {
            player1ImageName = card1.imageName
            player2ImageName = card2.imageName
            gameStatusText = cardGameHelper.decideWinner(card1: card1, card2: card2)
        }
    }
}

extension GameViewModel: CardGameDelegate {
    func getReadyForShuffle() {
        playButtonText = "SHUFFLE"
    }
    
    func resetUI() {
        playButtonText = "PLAY"
        player1ImageName = "back"
        player2ImageName = "back"
        gameStatusText = "Play Again"
    }
    
    
}
