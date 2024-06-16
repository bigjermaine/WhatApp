//
//  ChanneltemView.swift
//  WhatApp
//
//  Created by MacBook AIR on 03/06/2024.
//

import SwiftUI

struct ChanneltemView: View {
    var body: some View {
        HStack{
            Circle()
                .frame(width: 60,height: 60)
            VStack(alignment:.leading,spacing: 3){
                titleTextView()
                lastMessagePreview()
            }
        }
    }
    private func titleTextView() -> some View {
        HStack{
            Text("Username here")
                .lineLimit(1)
                .bold()
            Spacer()
            Text("5:50pm")
                .foregroundStyle(.gray)
                .font(.system(size: 15))
        }
    }
    
    private func lastMessagePreview() -> some View {
        Text("Hey welcome")
            .font(.system(size: 16))
            .lineLimit(2)
            .foregroundColor(.gray)
    }
}

#Preview {
    ChanneltemView()
}
