//
//  ContentView.swift
//  CardGameSwiftUI
//
//  Created by Sitare Arslanturk on 1.01.2023.
//

import SwiftUI

struct GameView: View {
//  @StateObject - state object held in memory
//  @ObservedObject - stateless, inject viewmodel from constructor
    @StateObject private var viewModel = GameViewModel()
//    use $ with state variables
    @State private var infoPresented = false
    @State private var shouldNavigateToTop20 = false
    
    var body: some View {
        NavigationView {
            VStack {
//                changing the order of the functions matter!
                Text("WELCOME")
                    .background(Color.green)
                    .padding(20)
                    .padding(.top, 40)
                
                Text(viewModel.gameStatusText)
                    .padding(20)
                    .background(Color.blue)
                
                players
                
                playButton
                
                Spacer()

                buttonBar
                
//                'init(_:isActive:destination:)' was deprecated in iOS 16.0: use NavigationLink(_:value:) inside a NavigationStack or NavigationSplitView ???
                NavigationLink("", isActive: $shouldNavigateToTop20) {
                    InfoView()
                }
                
            }
            .sheet(isPresented: $infoPresented) {
                InfoView()
            }
            .navigationTitle("Best Card Game")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private var playButton: some View {
        /*
        Button(viewModel.playButtonText) {
            viewModel.drawCards()
        }
        .padding(20)
         */
        Button {
            viewModel.drawCards()
        } label: {
            Text(viewModel.playButtonText)
                .padding(20)
        }
        .background(Color.orange)
        .cornerRadius(40)
        .shadow(color: .orange, radius: 15)
        .foregroundColor(.white)
        .padding(20)

    }
    
    private var buttonBar: some View {
        HStack {
            Button("INFO") {
                infoPresented.toggle()
            }
            
            Spacer()
            
//            you can also use custom views in navigation link
//            works similar to button
            NavigationLink("TOP TEN") {
                TopTenView()
            }
            
            Spacer()
            
            Button {
                shouldNavigateToTop20.toggle()
            } label: {
                Text("TOP 20")
                    .padding(20)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(15)
                    .shadow(radius: 15)
            }
        }
        .padding(20)
    }
    
    private var players: some View {
        HStack {
            PlayerView(title: "Player 1", imageName: viewModel.player1ImageName)
            PlayerView(title: "Player 2", imageName: viewModel.player2ImageName)
        }.padding(20)
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
//        shows the whole page
        GameView()
//        shows the items on the page
        GameView()
            .previewLayout(.sizeThatFits)
    }
}
