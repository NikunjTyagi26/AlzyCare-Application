//
//  Calendar.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 06/06/24.
//


import Foundation
import SwiftUI

struct DayCell: View {
    let day: Int
    let isCurrentDate: Bool

    var body: some View {
        Text("\(day)")
            .frame(width: 50, height: 50) // Adjust size as needed
            .background(isCurrentDate ? Color.purple : Color.gray)
            .foregroundColor(isCurrentDate ? .white : .black)
            .cornerRadius(25)
            .padding()
    }
}

struct ContentView: View {
    let daysOfMonth = Array(1...30)
    let currentDay = Calendar.current.component(.day, from: Date())

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(daysOfMonth, id: \.self) { day in
                    DayCell(day: day, isCurrentDate: day == currentDay)
                }
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
