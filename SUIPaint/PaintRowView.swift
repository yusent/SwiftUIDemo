//
//  PaintRowView.swift
//  SUIPaint
//
//  Created by Yusent Chig on 07/11/19.
//  Copyright © 2019 Yusent Chig. All rights reserved.
//

import SwiftUI

struct PaintRowView: View {
    @ObservedObject var viewModel: PaintModel
    
    var body: some View {
        HStack {
            Rectangle()
                .foregroundColor(viewModel.color)
                .frame(width: 30, height: 30)
            Text(viewModel.hexString)
        }
    }
}

struct PaintRowView_Previews: PreviewProvider {
    static var previews: some View {
        PaintRowView(viewModel: PaintModel())
    }
}
