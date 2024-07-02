//
//  ChatPickerScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import SwiftUI

struct ChatPickerScreen: View {
    @State private var searchText = ""
    @Environment(\.dismiss) private var dimiss
    var body: some View {
        NavigationStack{
            List{
                ForEach(ChatPartnerPickerOption.allCases) { x in
                    HeaderItemView(item: x)
                }
                Section{
                    ForEach(0..<12) { _ in 
                        ChatPattternRowView(user:  UserItem(uid: "", username: "", email: ""))
                    }
                }
            }
            .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),  prompt: "Search name or number")
            .navigationTitle("New Chat")
            .navigationTitle("New Out")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                trailingNavItem()
            }
        }
    }
}
extension ChatPickerScreen {
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            cancelButton()
        }
    }
    private func cancelButton() -> some View {
        Button {
            dimiss()
        }label: {
            Image(systemName: "xmark")
                .font(.footnote)
                .bold()
                .foregroundStyle(.gray)
                .background(Color(.systemGray5))
                .clipShape(Circle())
        }
    }
}

extension ChatPickerScreen {
    
    private struct HeaderItemView:View {
        let item:ChatPartnerPickerOption
        var body: some View {
            buttonBody()
        }
        
        private func buttonBody() -> some   View {
            HStack{
             
                Image(systemName:item.imageName)
                    .font(.footnote)
                    .frame(width: 40,height: 40)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
                Text(item.title)
                    .foregroundStyle(.whatsAppBlack)
            }
        }
    }
}
enum ChatPartnerPickerOption:String,CaseIterable,Identifiable{
    var id:String{
        return  rawValue
    }
    var title:String {
        return rawValue
    }
    var imageName:String {
        switch self {
         case .newGroup:
            return "green.2.fill"
        case .newContact:
            return "person.fill.badge.plus"
        case .newCommunity:
            return "person.3.fill"
        }
    }
    case newGroup = "New Group"
    case newContact = "New Contact"
    case newCommunity = "New Community"
    
}
#Preview {
    ChatPickerScreen()
}
