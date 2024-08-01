//
//  Diamond.swift
//  SET
//
//  Created by Ryan Boyle on 7/23/24.
//

import SwiftUI

struct Diamond: Shape {
    
    func path(in rect: CGRect) -> Path {
        let top = CGPoint(x: rect.width/2, y: 0)
        let rightCorner = CGPoint(x: rect.width, y: rect.height/2)
        let bottom = CGPoint(x: rect.width/2, y: rect.height)
        let leftCorner = CGPoint(x: 0, y: rect.height/2)
        
        var p = Path()
        p.move(to: top)
        p.addLine(to: rightCorner)
        p.addLine(to: bottom)
        p.addLine(to: leftCorner)
        p.addLine(to: top)
        return p
    }
}

#Preview {
    Diamond()
}
