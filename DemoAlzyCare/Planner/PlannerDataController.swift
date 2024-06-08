//  PlannerDataController.swift
//  DemoAlzyCare
//
//  Created by Batch-2 on 03/06/24.

import Foundation

var memoryN = [Activity(name: "Flip card ", image: "FlipCard", description: "Flip the card , remeber the sequence ", segueID: "FlipNormal"),
               Activity(name: "Round Table", image: "RoundTable", description: "round the table  ", segueID: "RoundTableNormal")
            ]

var logicN = [Activity(name: "Puzzle Game", image: "PuzzleGame", description: "Solve the word puzzle to increase the ability", segueID: "PuzzleNormal"),
              Activity(name: "Calculate ", image: "Calci", description: "Solve the maths puzzle", segueID: "CalculateNormal")
]

var reasoningN = [Activity(name: "MatchColor", image: "Match", description: "Match the color", segueID: "MatchColorNormal"),
                  Activity(name: "ShapeBuilder", image: "Shape", description: "Shape", segueID: "ShapeBUilderNormal")]

var executiveN = [Activity(name: "Sudoku", image: "Sudoku", description: "Solve the sudoku ", segueID: "SudokuNormal"),
                  Activity(name: "speedTest", image: "Speedy", description: "test the speed ", segueID: "SpeedTestNormal")
                ]






var prefrence = [Activity(name: "Art & Craft", image: "Art", description: "Art and craft", segueID: "ArtAndCraft"),
                 Activity(name: " Photography", image: "Photography", description: "capture your 5 favourite thing picture", segueID: "Photography")
]







var memoryA = [Activity(name: "Flip card ", image: "FlipCard", description: "Flip the card , remeber the sequence ", segueID: "FlipAlzheimer"),
               Activity(name: "Round Table", image: "RoundTable", description: "round the table  ", segueID: "RoundTableAlzheimer")]
var logicA = [Activity(name: "Puzzle Game", image: "PuzzleGame", description: "Solve the word puzzle to increase the ability", segueID: "PuzzleAlzheimer"),
              Activity(name: "Calculate ", image: "Calci", description: "Solve the maths puzzle", segueID: "CalculateAlzheimer")]
var reasoningA = [Activity(name: "MatchColor", image: "Match", description: "Match the color", segueID: "MatchColorAlzheimer"),
                  Activity(name: "ShapeBuilder", image: "Shape", description: "Shape", segueID: "ShapeBuilderAlzheimer")]

var executiveA = [Activity(name: "Sudoku", image: "Sudoku", description: "Solve the sudoku ", segueID: "SudokuAlzheimer"),
                  Activity(name: "speedTest", image: "Speedy", description: "test the speed ", segueID: "SpeedTestAlzheimer")]





var specialActivity = [Activity(name: "Reminiscence Therapy", image: "RT", description: "Therapy", segueID: "RT"), Activity(name: "Sage Test", image: "sageTest", description:    "Alzheimer Assessment", segueID: "SG")]


var normalActivity = [memoryN, logicN, reasoningN, executiveN, prefrence]
var alzheimerActivity = [memoryA, logicA, reasoningA, executiveA, prefrence]
