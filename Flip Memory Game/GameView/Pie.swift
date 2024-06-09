//
//  Pie.swift
//  DemoAlzyCare
//
//  Created by Nikunj Tyagi on 09/06/24.
//


import Foundation
import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    
    var animatableData: AnimatablePair<Double, Double> {
        get{
            AnimatablePair(startAngle.radians, endAngle.radians)
        }
        set{
            startAngle = Angle.radians(newValue.first)
            endAngle = Angle.radians(newValue.second)
        }
    }
    
    
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.size.width / 2, y: rect.size.width - 15)
        let radius = min(rect.width, rect.height) / 2
        
        var p = Path()
        p.move(to: center)
        p.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false)
        p.closeSubpath()
        return p
    }
}
