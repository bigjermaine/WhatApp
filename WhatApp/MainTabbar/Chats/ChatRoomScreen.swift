//
//  ChatRoomScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 15/06/2024.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        ScrollView{
            LazyVStack {
                ForEach(1...10, id: \.self) { count in
                Text("PlaceHolder")
                        .font(.largeTitle)
                        .bold()
                        .frame(maxWidth:.infinity)
                        .frame(height: 200)
                        .background(Color.gray.ignoresSafeArea())
                }
            }
        }
        .toolbar{
            leadingNAVItem()
        }
    }
}

extension ChatRoomScreen {
    @ToolbarContentBuilder
    private func leadingNAVItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            HStack{
                Circle()
                    .frame(width: 35,height: 35)
            }
        }
    }
}
#Preview {
    NavigationStack{
        ChatRoomScreen()
    }
}
