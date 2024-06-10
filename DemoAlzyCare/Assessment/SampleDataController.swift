//
//  SampleDataController.swift
//  AssessmentSample
//
//  Created by Gaurav on 31/05/24.
//

import Foundation

func getTodayDateString() -> String {
    let currentDate = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd"
    return dateFormatter.string(from: currentDate)
}

let userPersonalInfo = PersonalInfo(userName: "gaurav", userFatherName: "ram babu mishra", userMotherName: "madhu mishra", userPhoneNumber: "8882445490", userCountryName: "india", userCityName: "delhi", userBirthDate: getTodayDateString(), userBirthMonth: "january", userBirthYear: "1", userSchoolName: "asvj")

var question1 = [Question(questionText: "What is today's date?", options: nil, correctAnswer: getTodayDateString(), questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .textField, categoryType: .memory)]

// Remaining questions...

var question2 = [Question(questionText: "Name the picture.", options: ["Dog", "Cat", "Lion", "Horse"], correctAnswer: "Dog", questionImage: "Dog", questionTextLabel: nil, questionMultiOptions: nil, questionType: .questionImageView, categoryType: .memory)]

var question3 = [Question(questionText: "Which of these object used to tell time ?", options: ["Watch", "Key", "Book", "Chair"], correctAnswer: "Watch", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .reasoning)]

var question4 = [Question(questionText: "How many weels does car have?", options: ["2", "5", "4", "3"], correctAnswer: "4", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .memory)]

var question5 = [Question(questionText: "Can you solve the problem 3 * 2 = ?", options: ["9", "6", "5", "1"], correctAnswer: "6", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .logic)]

var question6 = [Question(questionText: "Remember the sequence.", options: nil, correctAnswer: nil, questionImage: nil, questionTextLabel: "🙂😀😂", questionMultiOptions: nil, questionType: .textViewLabel, categoryType: .memory)]

var question7 = [Question(questionText: "Select similar emoji.'😁'", options: ["🙂","😁","😃","😆"], correctAnswer: "😁", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .executiveFunction)]

var question8 = [Question(questionText: "Which pair of words are similar?'", options: ["Sky : Sky", "Tree : Tere", "House : Huose" , "Dog : Dgo" ], correctAnswer: "Sky : Sky", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .executiveFunction)]

var question9 = [Question(questionText: "Select Birds from the following.", options: ["Dog, Lion, Tiger", "Sparrow, Crow, Eagle", "Snake, Lizard, Worm", "Monkey, Cat, Rat"], correctAnswer: "Sparrow, Crow, Eagle", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .reasoning)]

var question10 = [Question(questionText: "If you have 10 apples and you give away 3, how many apples do you have left?", options: ["6", "7", "10", "3"], correctAnswer: "7", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .logic)]

var question11 = [Question(questionText: "What is this shape?", options: ["Rectangle", "Square", "Cube", "Cuboid"], correctAnswer: "Square", questionImage: "Square", questionTextLabel: nil, questionMultiOptions: nil, questionType: .questionImageView, categoryType: .executiveFunction)]

var question12 = [Question(questionText: "Write down the sequence of emoji that you have seen above.", options: ["🙂😀😂","🙂😂😀","😀🙂😂","😂🙂😀"], correctAnswer: "🙂😀😂", questionImage: nil, questionTextLabel: nil, questionMultiOptions: nil, questionType: .options, categoryType: .memory)]


var assessmentQuestions = [question1, question2, question3, question4, question5, question6, question7, question8, question9, question10, question11, question12]

var userScore = AssessmentScore(totalScore: 0, executiveFunctionScore: 0, logicScore: 0, memoryScore: 0, reasoningScore: 0)
