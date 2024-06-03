//
//  ChatTabbarView.swift
//  WhatApp
//
//  Created by MacBook AIR on 03/06/2024.
//

import SwiftUI

struct ChatTabbarView: View {
    @State private var searchText:String = ""
    var body: some View {
        NavigationStack{
            List{
                
            }
            .navigationTitle("Chats")
            .searchable(text: $searchText)
            .toolbar {
                leadingNavItems()
                trailingNavItems()
            }
        }
    }
}

extension ChatTabbarView {
    @ToolbarContentBuilder
    private func leadingNavItems() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Menu{
                Button{
                    
                }label: {
                    Label("Selected Chats", systemImage: "checkmark.circle")
                }
            }label: {
                Image(systemName: "ellipsis.circle")
            }
        }
    }
    @ToolbarContentBuilder
    private func trailingNavItems() -> some ToolbarContent  {
        ToolbarItemGroup(placement: .topBarTrailing) {
            allButtons()
            newChatButton()
            cameraButton()
        }
    }
    
    private func allButtons() -> some View {
        Button{
            
        }label: {
            Image(.circle)
        }
    }
    
    private func newChatButton() -> some View {
        Button{
            
        }label: {
            Image(.plus)
        }
    }
    private func cameraButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "camera")
        }
    }
}


#Preview {
    ChatTabbarView()
}
