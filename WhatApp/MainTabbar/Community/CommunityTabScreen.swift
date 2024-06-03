//
//  CommunityTabScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 03/06/2024.
//

import SwiftUI

struct CommunityTabScreen: View {
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment:.leading,spacing: 10) {
                    Image(.communities)
                    Group{
                        Text("Stay connected with a community")
                            .font(.title2)
                        Text("Communities bring members tigether in topic based groups Any community you are added to will appear here")
                            .foregroundStyle(.gray)
                        HStack{
                            Spacer()
                            Text("See example commmunities")
                                .bold()
                            Spacer()
                        }
                        Button{
                            
                        }label: {
                            Label("New Community", systemImage: "plus")
                                .padding(8)
                                .padding(.horizontal,20)
                        }
                        .bold()
                        .frame(maxWidth:.infinity,alignment: .center)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                        
                    }
                    .padding(.horizontal,10)
                }
                .padding()
            }
            .navigationTitle("Communities")
        }
    }
    
}

#Preview {
    CommunityTabScreen()
}
