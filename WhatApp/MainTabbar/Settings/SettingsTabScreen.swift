//
//  SettingsTabScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 03/06/2024.
//

import SwiftUI

struct SettingsTabScreen: View {
    @State private var searchText = ""
    var body: some View {
        NavigationStack{
            List{
                Section{
                    HStack{
                        Circle()
                            .frame(width: 55,height: 55)
                        userInfoTextView()
                    }
                    VStack{
                        
                        SettingItemView(Item: .contactDetails)
                    }
                }
                Section{
                    SettingItemView(Item: .broadCastLists)
                    SettingItemView(Item: .starredMessages)
                    SettingItemView(Item: .linkedDevices)
                }
                
                Section{
                    SettingItemView(Item: .account)
                    SettingItemView(Item: .privacy)
                    SettingItemView(Item: .chats)
                    SettingItemView(Item: .notifications)
                    SettingItemView(Item: .storage)
                }
                Section{
                    SettingItemView(Item: .help)
                    SettingItemView(Item: .tellFriend)
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
            .toolbar{
                leadingNavItem() 
            }
        }
        
    }
    private func userInfoTextView() -> some View {
        VStack(alignment: .leading,spacing:0){
                HStack{
                    Text("Qo User 13")
                        .font(.title2)
                    Spacer()
                    Image(.qrcode)
                        .renderingMode(.template)
                        .padding(5)
                        .foregroundColor(.blue)
                        .background(Color(.systemGray5))
                        .clipShape(Circle())
                    
                }
    
                Text("Hey there! I am using Whatapp")
                    .foregroundStyle(.gray)
                    .font(.callout)
                
            }
            
          
        
    }
    
}
extension SettingsTabScreen {
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Sign Out") {
                Task{
                     try? await AuthManager.shared.logOut()
                }
            }
        }
    }
}
#Preview {
    SettingsTabScreen()
}
