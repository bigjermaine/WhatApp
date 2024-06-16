//
//  ChatRoomScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 15/06/2024.
//

import SwiftUI

struct ChatRoomScreen: View {
    var body: some View {
        MessageListView()
        .safeAreaInset(edge: .bottom) {
            TextInputArea()
        }
        .toolbar{
            leadingNAVItem()
            trailingNAVItem()
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
                
                Text("QaUser12")
                    .bold()
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNAVItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            HStack{
                Button{
                    
                }label: {
                    Image(systemName: "video")
                }
                
                Button{
                    
                }label: {
                    Image(systemName: "phone")
                }
            }
        }
    }
}
#Preview {
    NavigationStack{
        ChatRoomScreen()
    }
}
