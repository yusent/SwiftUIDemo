//
//  PaintView.swift
//  SUIPaint
//
//  Created by Yusent Chig on 29/10/19.
//  Copyright © 2019 Yusent Chig. All rights reserved.
//

import SwiftUI

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
                Button(action: {
                    withAnimation {
                        self.viewModel.darken()
                    }
                }) {
                    Text("Darken")
                        .padding(.all, 8)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
                Button(action: {
                    withAnimation {
                        self.viewModel.brighten()
                    }
                }) {
                    Text("Brighten")
                        .padding(.all, 8)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                Spacer()
            }
            Button(action: {
                withAnimation {
                    self.viewModel.randomize()
                }
            }) {
                Text("Randomize")
                    .padding(.all, 8)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }.padding(.top)
            Spacer()
        }.padding(.horizontal)
    }
}

struct PaintView_Previews: PreviewProvider {
    static var previews: some View {
        PaintView(viewModel: PaintModel())
    }
}
