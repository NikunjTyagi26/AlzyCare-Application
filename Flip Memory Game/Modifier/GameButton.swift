//
//  GameButton.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import Foundation
import SwiftUI

//Button modifiers for game button
struct GameButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(10)
            .frame(width: 150)
            .background(Color("Red-Wine"))
            .foregroundColor(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Green"), lineWidth: 5)
            )
            .padding(5)
    }
}
