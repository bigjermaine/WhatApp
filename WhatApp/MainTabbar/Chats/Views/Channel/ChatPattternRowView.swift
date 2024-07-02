//
//  ChatPattternRowView.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import SwiftUI

struct ChatPattternRowView: View {
    let user:UserItem
    var body: some View {
        HStack{
            Circle()
                .frame(width: 40, height: 40)
            VStack(alignment:.leading){
                Text(user.username)
                    .bold()
                    .foregroundStyle(.whatsAppBlack)
                Text(user.bioUnwrapped)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
            }
        }
    }
}

#Preview {
    ChatPattternRowView(user: UserItem(uid: "", username: "", email: ""))
}
