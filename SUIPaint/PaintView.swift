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
}

struct PaintView: View {
    var viewModel = PaintModel(red: 0.5, green: 0.5, blue: 0.5)
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(red: viewModel.red, green: viewModel.green, blue: viewModel.blue))
                .frame(height: 300)
            Spacer()
        }.padding()
    }
}

struct PaintView_Previews: PreviewProvider {
    static var previews: some View {
        PaintView()
    }
}
