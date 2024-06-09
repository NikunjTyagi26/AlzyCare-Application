//
//  UserModel.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//

import Foundation
import SwiftUI

struct UserModel {
    private(set) var user: [String]
    private(set) var point: [Int]
    
    private let database = UserDefaults.standard
    
    //Initialize and store the data in userdefaults
    init() {
        user = database.object(forKey: "User") as? [String] ?? []
        point = database.object(forKey: "Point") as? [Int] ?? []
    }
    
    //Get all users
    func getUsers() -> [String] {
        return user
    }
    
    //Get all points
    func getPoints() -> [Int] {
        return point
    }
    
    //Add user into the array
    mutating func addUser(_ info: String) {
        user.append(info)
        database.set(user, forKey: "User")
        print(user)
    }
    
    //Add point into the array
    mutating func addPoint(_ score: Int) {
        point.append(score)
        database.set(point, forKey: "Point")
        print(point)
    }
    
    //Get the point from a specific user
    func getPoint(name: String) -> Int {
        let index = user.firstIndex(of: name) ?? 0
        return point[index]
    }
    
    //Update point along side when user is playing
    mutating func updateLastPoint(point: Int) {
        let idx = user.count - 1
        self.point[idx] = point
        database.set(self.point, forKey: "Point")
    }
}
