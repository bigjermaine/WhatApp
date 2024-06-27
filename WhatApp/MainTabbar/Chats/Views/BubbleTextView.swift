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
        VStack(alignment: .leading, spacing:3){
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .padding(10)
                .background(item.backgroundColor)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: /*@START_MENU_TOKEN@*/.continuous/*@END_MENU_TOKEN@*/))
                .applyTail(item.direction)
            timeStampTextView()
        }
        .shadow(color:Color(.systemGray3), radius:5)
        .frame(maxWidth: .infinity,alignment: item.alignment)
        .padding(.leading,item.direction == .received ? 5 : 100)
        .padding(.trailing,item.direction == .received ? 100 : 5)
    }
    private func timeStampTextView() -> some View {
        HStack{
            Text("3:05 PM")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15,height: 15)
                    .foregroundStyle(Color(.systemRed ))
            }
        }
    }
}


#Preview {
    ScrollView{
        BubbleTextView(item:.sentPlaceHolder)
        BubbleTextView(item:.receivePlaceHolder)
    }
}
