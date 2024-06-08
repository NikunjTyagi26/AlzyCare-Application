//
//  SampleDataModel.swift
//  AssessmentSample
//
//  Created by Gaurav on 29/05/24.
//

import Foundation

struct PersonalInfo {
    let userName: String
    let userFatherName: String
    let userMotherName: String
    let userPhoneNumber: String
    let userCountryName: String
    let userCityName: String
    let userBirthDate: String
    let userBirthMonth: String
    let userBirthYear: String
    let userSchoolName: String
}

struct Question {
    let questionText: String
    let options: [String]?
    let correctAnswer: String?
    let questionImage: String?
    let questionTextLabel: String?
    let questionMultiOptions: [String]?
    let questionType: QuestionType
    let categoryType: CategoryType
}

enum CategoryType {
    case memory, logic, reasoning, executiveFunction, none
}

enum QuestionType {
    case textField, questionImageView, options, textViewLabel, none
}



struct AssessmentScore {
    var totalScore: Int?
    var executiveFunctionScore: Int?
    var logicScore: Int?
    var memoryScore: Int?
    var reasoningScore: Int?
}


