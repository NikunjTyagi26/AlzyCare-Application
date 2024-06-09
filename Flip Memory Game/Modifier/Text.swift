//
//  Text.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import SwiftUI

//Text modifiers for main text
struct TextModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("White"))
            .font(.system(.title3, design: .rounded))
    }
}
