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
                    SettingItemView()
                }
            }
            .navigationTitle("Settings")
            .searchable(text: $searchText)
        }
        
    }
}

#Preview {
    SettingsTabScreen()
}
