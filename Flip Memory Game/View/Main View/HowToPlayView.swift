//
//  HowToPlayView.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import SwiftUI

struct HowToPlayView: View {
    var body: some View {
        List{
            //Application introduction
            Section{
                Text("iMemory was created with simple gameplay for everyone to play. Users randomly pick 2 cards, if they are similar, users will have a score and these 2 cards will disappear. The user will win after all the cards have been matched.")
            } header: {
                Text("Introduction")
            }
            .headerProminence(.increased)
            
            //Game mode for this application
            Section {
                Text("""
                    Easy mode:
                    
                    Contains 4 similar pairs, earn 10 points for each matching pairs.
                    """)
                Text("""
                    Medium mode:
                    
                    Contains 6 similar pairs, earn 10 points for each matching pairs.
                    
                    Bonus points rewarded when selecting within the time limit, maximum bonus points: 5.
                    """)
                Text("""
                    Hard mode:
                    
                    Contains 8 similar pairs, earn 10 points for each matching pairs.
                     
                    Bonus points will be the same as medium.
                    
                    Deducted 5 points if choose the wrong cards. There will be no negative score.
                    """)
            } header: {
                Text("Game mode")
            } footer: {
                Text("""
                     Select a game mode before playing the game, different mode will have different scoring method and a different number of cards.
                     """)
            }
            .headerProminence(.increased)
            
            //Leaderboard instruction
            Section {
                Text("All scores will be displayed on the leaderboard with the respective player’s name.")
            } header: {
                Text("Leaderboard score")
            } footer: {
                Text("If the user exits the application before completing the game, the last attempt score will not be registered")
            }
            .headerProminence(.increased)
            
            //Author section
           
        }
        .navigationTitle("How to play")
        //Play background music on appear
//        .onAppear {
//            MusicPlayer.shared.startBackgroundMusic(backgroundMusicFileName: "birdfish-happy-loop")
//        }
//        .onDisappear {
//            MusicPlayer.shared.stopBackgroundMusic()
//        }
    }
    }


#Preview {
    HowToPlayView()
}
