//
//  PaintModel.swift
//  SUIPaint
//
//  Created by Yusent Chig on 07/11/19.
//  Copyright © 2019 Yusent Chig. All rights reserved.
//

import SwiftUI

class PaintModel: ObservableObject {
    @Published var red = Double.random(in: 0...1)
    @Published var green = Double.random(in: 0...1)
    @Published var blue = Double.random(in: 0...1)
    
    static func clamp(_ value: Double, _ diff: Double) -> Double {
        return max(min(value + diff, 1), 0)
    }
    
    func randomize() {
        red = Double.random(in: 0...1)
        green = Double.random(in: 0...1)
        blue = Double.random(in: 0...1)
    }
    
    func incBy(_ inc: Double = 0.1) {
        red = Self.clamp(red, inc)
        green = Self.clamp(green, inc)
        blue = Self.clamp(blue, inc)
    }
    
    func brighten() {
        incBy(0.1)
    }
    
    func darken() {
        incBy(-0.1)
    }
    
    var hexString: String {
        return String(format: "0x%02x%02x%02x", UInt8(red * 255), UInt8(green * 255), UInt8(blue * 255))
    }
    
    var color: Color {
        return Color(red: red, green: green, blue: blue)
    }
    
    var contrastColor: Color {
        let luminance = (0.2126 * red) + (0.7152 * green) + (0.0722 * blue)
        return luminance >= 0.6 ? .black : .white
    }
}

extension PaintModel: Hashable {
    static func == (lhs: PaintModel, rhs: PaintModel) -> Bool {
        return lhs.red == rhs.red && lhs.green == rhs.green && lhs.blue == rhs.blue
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(red)
        hasher.combine(green)
        hasher.combine(blue)
    }
}
