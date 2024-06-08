//
//  ContentView.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 08/06/24.
//

import SwiftUI

struct ContentVieew: View {
    var body: some View {
        MemoryMatchView(viewModel: MemoryMatchViewModel(difficulty: .easy, theme: .objects))
    }
}

#Preview {
    ContentView()
}
