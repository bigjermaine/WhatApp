//
//  CallsTabScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 29/05/2024.
//

import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText:String = ""
    var body: some View {
        NavigationStack{
            List{
                
            }
            .searchable(text: $searchText)
            .navigationTitle("Calls")
        }
    }
}

#Preview {
    CallsTabScreen()
}
