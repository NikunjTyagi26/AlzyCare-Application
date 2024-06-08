//
//  PlannerDataModel.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 06/06/24.
//


import Foundation

enum ActivityLevel{
    case normal, alzheimer, Nil
}

var startDate = 0

struct userScoreSage{
    var memoryScore: ActivityLevel
    var logicScore: ActivityLevel
    var reasoningScore: ActivityLevel
    var executiveScore: ActivityLevel
}

struct Activity{
    var name: String
    var image: String
    var description: String
    var segueID: String
}


var userResult = userScoreSage(memoryScore: .Nil, logicScore: .Nil, reasoningScore:.Nil, executiveScore: .Nil)

//
//
//var memoryN = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "FlipCardNormalViewController")]
//
//var logicN = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "FlipCardNormalViewController")]
//
//var reasoningN = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "PuzzleNormalViewController")]
//
//var executiveN = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController")]
//
//
//
//
//
//
//var prefrence = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController")]
//
//
//
//
//
//
//
//var memoryA = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "FlipCardNormalViewController")]
//
//var logicA = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "FlipCardNormalViewController")]
//
//var reasoningA = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "PuzzleNormalViewController")]
//
//var executiveA = [Activity(name: "Gaurav", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController"), Activity(name: "Gaurav1", image: "Gaurav", description: "Gaurav", storyBoardID: "ArtandCraftViewController")]
//
//
//
//
//var specialActivity = [Activity(name: "Reminiscence Therapy", image: "", description: "", storyBoardID: ""), Activity(name: "Sage Test", image: "", description:    "", storyBoardID: "")]
//
//
//



//
//
//


