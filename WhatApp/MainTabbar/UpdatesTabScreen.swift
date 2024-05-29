//
//  UpdatesTabScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 27/05/2024.
//

import SwiftUI

struct UpdatesTabScreen: View {
    @State  private var searchText = ""
    var body: some View {
        NavigationStack{
            List{
                StatusSectionHeader()
            }
            .navigationTitle("Updates")
            .searchable(text: $searchText)
        }
        
    }

    private  struct StatusSectionHeader: View {
        var body: some View {
            HStack(alignment:.top){
                Image(systemName: "circle.dashed")
                    .foregroundColor(.blue)
                    .imageScale(.large)
                (
                 Text("User Status to share phtos, text and videos that disappear in 24 hours")
                    +
                    Text(" ")
                    +
                    Text("Status Privacy")
                        .foregroundColor(.blue).bold()
                    
                )
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
            }
        }
    }
}

#Preview {
    UpdatesTabScreen()
}
