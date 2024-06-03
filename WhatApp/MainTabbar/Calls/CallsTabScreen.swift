//
//  CallsTabScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 29/05/2024.
//

import SwiftUI

struct CallsTabScreen: View {
    @State private var searchText:String = ""
    @State private var callhistory = CallHistory.all
    var body: some View {
        NavigationStack{
            List{
                CreateCallLinkSetion()
                Section{
                    ForEach(0..<10) {_ in
                        RecentCallItemView()
                    }
                }header: {
                    Text("Recent")
                        .textCase(nil)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Calls")
            .toolbar{
                trailingNavItem()
                principalNavItem()
                leadingNavItem()
            }
        }
    }
}

#Preview {
    CallsTabScreen()
}

extension CallsTabScreen {
    
    
    private struct RecentCallItemView:View {
        var body: some View {
            HStack{
                Circle()
                    .frame(width: 40,height: 40)
                recentCallsTextView()
                Spacer()
                Text("Yesterday")
                    .foregroundStyle(.gray)
                    .font(.system(size: 16))
              
                Image(systemName: "info.circle")
               
            }
        }
        
        private func recentCallsTextView()  -> some View {
            VStack(alignment:.leading){
                Text("John Smith")
                HStack(spacing:5){
                   Image(systemName: "phone.arrow.up.right.fill")
                    Text("Outgoing")
                }
                .font(.system(size:14))
                .foregroundStyle(.gray)
            }
        }
    }
    
    private struct CreateCallLinkSetion:View {
        var body: some View {
            HStack{
                Image(systemName: "link")
                    .padding(8)
                    .background(Color(.systemGray6))
                    .clipShape(Circle())
                VStack(alignment:.leading){
                    Text("Create Call Link")
                        .foregroundStyle(.blue)
                    Text("Share a link your whatapp Call")
                        .foregroundStyle(.gray)
                        .font(.caption)
                }
            }
        }
    }
    
    @ToolbarContentBuilder
    private func trailingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarLeading) {
            Button("Edit"){}
        }
    }
    @ToolbarContentBuilder
    private func principalNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .principal) {
            Picker("",selection: $callhistory) {
                ForEach(CallHistory.allCases){ item in
                    Text(item.rawValue.capitalized)
                        .tag(item)
                    
                }
                
            }
            .pickerStyle(.segmented)
            .frame(width: 150)
        }
        
    }
    @ToolbarContentBuilder
    private func leadingNavItem() -> some ToolbarContent {
        ToolbarItem(placement: .topBarTrailing) {
            Button{
                
            }label: {
                Image(systemName: "phone.arrow.up.right")
            }
        }
    }
    
    private enum CallHistory:String,CaseIterable,Identifiable {
        case all, missed
        var id:String {
            return rawValue
        }
    }
}
