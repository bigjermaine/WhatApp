//
//  ChatPattternRowView.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import SwiftUI

struct ChatPattternRowView: View {
  private let user:UserItem
  private let trailingItem:Content
  init(user: UserItem, trailingItem: () -> Content = {EmptyView()}) {
    self.user = user
    self.trailingItem = trailingItem
  }
    var body: some View {
        HStack{
            Circle()
                .frame(width: 40, height: 40)
            VStack(alignment:.leading){
                Text(user.username)
                    .bold()
                Text(user.bioUnwrapped)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            }

          trailingItem
        }
    }
}

#Preview {
  ChatPattternRowView(user: UserItem(uid: "", username: "", email: "")) {
    Image(systemName: "xmark")
  }
}
