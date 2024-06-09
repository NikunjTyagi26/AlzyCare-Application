//
//  CardView.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import Foundation
import SwiftUI

//Card content view
struct CardView: View {
    var card: CardModel.Card
    
    @State private var animatedBonusRemaining: Double = 0
    
    var body: some View {
        GeometryReader {
            geo in
            ZStack {
                //Start time bonus animation for each card
                if card.isConsumingBonusTime {
                    Pie(startAngle: Angle(degrees: 0 - 90), endAngle: Angle(degrees: 1 - animatedBonusRemaining * 360 - 90)).padding(5).opacity(0.3)
                        .onAppear {
                            animatedBonusRemaining = card.bonusRemaining
                            withAnimation(.linear(duration: card.bonusTimeRemaining)) {
                                animatedBonusRemaining = 0
                            }
                        }
                } else { }
                
                Text(card.content).font(.largeTitle)
                    .rotationEffect(Angle.degrees(card.isMatched ? 360: 0))
            }
            .modifier(Cardify(isFaceUp: card.isFaceUp))
        }
    }
}
