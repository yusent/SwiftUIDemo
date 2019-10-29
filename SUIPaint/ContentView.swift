//
//  ContentView.swift
//  SUIPaint
//
//  Created by Yusent Chig on 29/10/19.
//  Copyright © 2019 Yusent Chig. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Hello")
                    .font(.largeTitle)
                    .fontWeight(.ultraLight)
                    .foregroundColor(Color.blue)
                Text("world")
            }
            HStack {
                Text("hello")
                Spacer()
                Text("world")
            }
            Spacer()
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
