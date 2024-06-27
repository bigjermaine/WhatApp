//
//  BubbleTextView.swift
//  WhatApp
//
//  Created by MacBook AIR on 27/06/2024.
//

import SwiftUI

struct BubbleTextView: View {
    let item:MessageItem
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(10)
            .background(item.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
            .applyTail(item.direction)
    }
}


#Preview {
    ScrollView{
        BubbleTextView(item:.sentPlaceHolder)
        BubbleTextView(item:.receivePlaceHolder)
    }
}
