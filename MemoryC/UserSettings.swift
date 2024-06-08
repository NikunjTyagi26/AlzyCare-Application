//
//  UserSettings.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 08/06/24.
//
import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var difficulty: Difficulty? {
        didSet {
            if let rawValue = difficulty?.rawValue {
                UserDefaults.standard.set(rawValue, forKey: "difficulty")
            }
        }
    }
    
    @Published var theme: Theme? {
            didSet {
                if let themeRawValue = theme?.rawValue {
                    UserDefaults.standard.set(themeRawValue, forKey: "theme")
                }
            }
        }

    init() {
        if let rawValue = UserDefaults.standard.value(forKey: "difficulty") as? Int {
            difficulty = Difficulty(rawValue: rawValue)
        }
        
        if let themeRawValue = UserDefaults.standard.string(forKey: "theme") {
                    theme = Theme(rawValue: themeRawValue)
        }
    }
}
