//
//  AddGroupChatPatterner.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import SwiftUI

struct AddGroupChatPartnerScreen: View {
    @State private var searchText = ""
  @ObservedObject var viewModel:ChatPartnerPickerViewModel
    var body: some View {
        List{
          if viewModel.showSelectedUsers {
            Text("User selected")
          }
          Section{
            ForEach([UserItem(uid: "", username: "", email: "")]){ item in
              Button {
                viewModel.handleItemSelction(item)
              } label: {
                chatPartenerRowView(item)
              }

            }
          }

        }
        .animation(.easeInOut,value: viewModel.showSelectedUsers)
        .searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),  prompt: "Search name or number")
    }

  private  func chatPartenerRowView(_ user: UserItem) -> some View {
    ChatPattternRowView(user: UserItem(uid: "", username: "", email: "")) {
      Spacer()
      let isSelected = viewModel.isUserSelected(user)
      let imageName = isSelected ? "checkmark.circle.fill" : "circle"
      let foregroundStyle  = isSelected ? Color.blue : Color(.systemGray4)
      Image(systemName: imageName)
        .foregroundStyle(Color(foregroundStyle))
        .imageScale(.large)
    }

  }
}

#Preview {
    AddGroupChatPartnerScreen()
}
