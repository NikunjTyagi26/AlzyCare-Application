//
//  HomeView.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import SwiftUI
import AVFoundation

struct HomeView: View {
    
    init() {
        //For debug only: reset the data that's store in UserDefaults
//        UserDefaults.standard.set("", forKey: "User")
//        UserDefaults.standard.set("", forKey: "Point")
    }
    
    //View change variable for button
    @State private var action: Int? = 0
    var body: some View {
        NavigationView {
            ZStack {
                Color("Purple")
                    .ignoresSafeArea()
                VStack {
                    Image("iMemory")
                        .resizable()
                        .scaledToFit()
                    Spacer()
                    Text("Choose a game mode")
                        .modifier(TextModifier())
//                    game setting for three game mode
                    GameMode(gameMode: 4, tag: 1, action: $action, title: "EASY")
                    GameMode(gameMode: 8, tag: 2, action: $action, title: "MEDIUM")
                    GameMode(gameMode: 10, tag: 3, action: $action, title: "HARD")
                    Spacer()
                    HStack {
                        //Navigate to how to play view
                        NavigationLink(destination: HowToPlayView(), tag: 4, selection: $action) {
                            Button{
                                self.action = 4
//                                playSound(sound: "click", type: "wav")
                                
                            }label: {
                                Text("How to play")
                                    .padding(5)
                            }
                            .modifier(FunctionButotn(color: Color("Green")))
                        }
                        //Navigate to leaderboard view
                        NavigationLink(destination: Leaderboard(), tag: 5, selection: $action) {
                            Button {
                                self.action = 5
//                                playSound(sound: "click", type: "wav")
                            } label: {
                                Text("Leaderboard")
                                    .padding(5)
                            }
                            .modifier(FunctionButotn(color: Color("Green")))
                        }
                    }
                    
                    Spacer()
                }
            }
        }
        .navigationViewStyle(.stack)
    }
     
    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

