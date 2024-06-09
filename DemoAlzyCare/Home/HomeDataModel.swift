//
//  HomeDataModel.swift
//  DemoAlzyCare
//
//  Created by Batch-2 on 03/06/24.
//
import Foundation

struct AlzheimerQuote {
    let quote: String
}

struct Activitiy{
    var name: String
    var image: String
    var segueID: String
}

var sugestedActivity = [Activitiy(name: "TicTacToe ", image: "TicTacToe", segueID: "TicTacToe"), Activitiy(name: "Puzzle", image: "Puzzle", segueID: "HangMan"), Activitiy(name: "WordGame", image: "WordGame", segueID: "WordGame")]

class AlzheimerQuotesDataModel {
    let quotes: [AlzheimerQuote] = [
        AlzheimerQuote(quote: "Find joy in the simplest of moments."),
        AlzheimerQuote(quote: "Every moment is a fresh beginning."),
        AlzheimerQuote(quote: "Though the mind may forget, the heart always remembers."),
        AlzheimerQuote(quote: "In every forgetfulness, love persists."),
        AlzheimerQuote(quote: "Memories may fade, but love remains."),
        AlzheimerQuote(quote: "Every moment holds beauty."),
        AlzheimerQuote(quote: "Strength lies in the present.")
    ]
    
    func getRandomQuote() -> AlzheimerQuote {
        let randomIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[randomIndex]
    }
}
