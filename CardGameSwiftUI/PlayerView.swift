//
//  PlayerView.swift
//  CardGameSwiftUI
//
//  Created by Sitare Arslanturk on 2.01.2023.
//

import SwiftUI

struct PlayerView: View {
    
    let title: String
    let imageName: String
    
    var body: some View {
        VStack {
            Text(title)
            
            Image(imageName)
                .cornerRadius(15)
                .shadow(radius: 10)
        }
        .padding(20)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(title: "Player 1", imageName: "back")
            .previewLayout(.sizeThatFits)
    }
}
