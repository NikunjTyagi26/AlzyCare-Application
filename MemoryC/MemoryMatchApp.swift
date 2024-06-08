//
//  MemoryMatchApp.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 08/06/24.
//

import SwiftUI
@main
struct MemoryMatchApp: App {
    @StateObject private var userSettings = UserSettings()
    @State private var isAnimationComplete = false
    var body: some View {
        WindowGroup {
            if isAnimationComplete {
                if let difficulty = userSettings.difficulty {
                    MemoryMatchView(viewModel: MemoryMatchViewModel(difficulty: difficulty, theme: userSettings.theme ?? .objects))
                        .environmentObject(userSettings)
                } else {
                    DifficultySelectionView()
                        .environmentObject(userSettings)
                }
            } else {
                AnimatedSplashScreen(isAnimationComplete: $isAnimationComplete)
            }
        }    }
}

