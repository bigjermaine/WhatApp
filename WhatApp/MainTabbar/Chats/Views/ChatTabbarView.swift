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
                ArchivedBox()
                ForEach(0..<12){ x in
                    NavigationLink{
                        ChatRoomScreen()
                    }label: {
                        ChanneltemView()
                    }
                   
                }
                inboxFooterView()
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
    private func inboxFooterView() -> some View {
        HStack{
            Image(systemName: "lock.fill")
            Text("Your personal messages are")
            +
            Text("end-to-end encrpted")
                .foregroundStyle(.blue)
        }
        .foregroundColor(.gray)
        .font(.caption)
        .padding(.horizontal)
        
    }
    private func ArchivedBox() -> some View {
        Button{
            
        }label: {
            Label("Archived Chats", systemImage: "archivebox.fill")
                .bold()
                .foregroundColor(.gray)
        }
    }
    
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
