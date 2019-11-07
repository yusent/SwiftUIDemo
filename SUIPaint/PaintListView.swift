//
//  PaintListView.swift
//  SUIPaint
//
//  Created by Yusent Chig on 07/11/19.
//  Copyright © 2019 Yusent Chig. All rights reserved.
//

import SwiftUI

class PaintListModel: ObservableObject {
    @Published var paints = (1...100).map { _ in PaintModel() }
}

struct PaintListView: View {
    @ObservedObject var viewModel: PaintListModel
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.paints, id: \.self) { paint in
                    NavigationLink(destination: PaintView(viewModel: paint)) {
                        PaintRowView(viewModel: paint)
                    }
                }
            }.navigationBarTitle("Paints")
        }
    }
}

struct PaintListView_Previews: PreviewProvider {
    static var previews: some View {
        PaintListView(viewModel: PaintListModel())
    }
}
