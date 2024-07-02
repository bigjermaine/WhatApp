//
//  AddGroupChatPatterner.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import SwiftUI

struct AddGroupChatPartnerScreen: View {
    @State private var searchText = "''"
    var body: some View {
        List{
            Text("Place")
        }
        searchable(text: $searchText,placement: .navigationBarDrawer(displayMode: .always),  prompt: "Search name or number")
    }
}

#Preview {
    AddGroupChatPartnerScreen()
}
