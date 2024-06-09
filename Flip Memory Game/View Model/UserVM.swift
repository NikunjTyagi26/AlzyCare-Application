//
//  UserVM.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import Foundation

//User view model
class UserVM: ObservableObject {
    @Published private var model = UserModel()
    
    //get users from User model
    func getUsers() -> [String] {
        model.getUsers()
    }

    //Get a user point from the User model
    func getPoint(name: String) -> Int {
        model.getPoint(name: name)
    }
    
    //Add more user in User Model and initialize first score = 0
    func addUser(_ info: String) {
        print(info)
        model.addUser(info)
        model.addPoint(0)
    }
    
    //Add point to the User model
    func addPoint(_ score: Int) {
        model.addPoint(score)
        print(score)
    }
    
    //Get all points from user model
    func getPoints() -> [Int] {
        model.getPoints()
    }
    
    //upfate point while user is playing
    func updatePoint(point: Int) {
        model.updateLastPoint(point: point)
    }
}
