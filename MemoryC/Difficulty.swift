//
//  Difficulty.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 08/06/24.
//


import Foundation

enum Difficulty: Int, CaseIterable {
    case easy = 16
    case medium = 36
    case hard = 64
    
    var description: String {
        switch self {
        case .easy:
            return "Easy (4x4)"
        case .medium:
            return "Medium (6x6)"
        case .hard:
            return "Hard (8x8)"
        }
    }
}
