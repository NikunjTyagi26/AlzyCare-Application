//
//  Cardify.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//


import SwiftUI

//Card modifiers for each card in the game
struct Cardify: AnimatableModifier {
    var rotation: Double
    
    //Initialize the struct of Cardify
    init(isFaceUp: Bool) {
        rotation = isFaceUp ? 0 : 180
    }
    
    var animatableData: Double {
        get{rotation}
        set{rotation = newValue }
    }
    func body(content: Content) -> some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if rotation < 90 {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                
            } else {
                shape.fill()
            }
            content
                .opacity(rotation < 90 ? 1: 0)
        }
        .rotation3DEffect(Angle.degrees(rotation), axis: (0, 1, 0))
    }
}
