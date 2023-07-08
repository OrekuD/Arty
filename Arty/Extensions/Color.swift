//
//  Color.swift
//  Arty
//
//  Created by David Opoku on 08/07/2023.
//

import Foundation
import SwiftUI

extension Color {
    func inverted() -> Color {
        let uiColor = UIColor(self)
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        uiColor.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return Color(UIColor(red: 1-red, green: 1-green, blue: 1-blue, alpha: alpha))
    }
}
