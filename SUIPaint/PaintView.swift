//
//  PaintView.swift
//  SUIPaint
//
//  Created by Yusent Chig on 29/10/19.
//  Copyright © 2019 Yusent Chig. All rights reserved.
//

import SwiftUI

class PaintModel: ObservableObject {
    @Published var red: Double
    @Published var green: Double
    @Published var blue: Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
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

struct PaintView: View {
    @ObservedObject var viewModel: PaintModel
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .foregroundColor(viewModel.color)
                    .aspectRatio(contentMode: .fit)
                Text(viewModel.hexString) .foregroundColor(viewModel.contrastColor)
            }
            
            Slider(value: $viewModel.red, in: 0...1, step: 0.01)
            Slider(value: $viewModel.green, in: 0...1, step: 0.01)
            Slider(value: $viewModel.blue, in: 0...1, step: 0.01)
            HStack {
                Spacer()
                Button(action: self.viewModel.darken) {
                    Text("Darken")
                        .padding(.all, 8)
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                Spacer()
                Button(action: self.viewModel.brighten) {
                    Text("Brighten")
                        .padding(.all, 8)
                        .foregroundColor(.white)
                        .background(Color.blue)
                }
                Spacer()
            }
            Button(action: self.viewModel.randomize) {
                Text("Randomize")
                    .padding(.all, 8)
                    .foregroundColor(.white)
                    .background(Color.blue)
            }.padding(.top)
            Spacer()
        }.padding(.horizontal)
    }
}

struct PaintView_Previews: PreviewProvider {
    static var previews: some View {
        PaintView(viewModel: PaintModel(red: 0.5, green: 0.5, blue: 0.5))
    }
}
