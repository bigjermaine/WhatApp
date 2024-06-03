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
                .listRowBackground(Color.clear)
                StatusSection()
                Section {
                    RceentUpdates()
                }header: {
                    Text("Recent Updates")
                }
                Section {
                ChannelListView()
                }header: {
                    ChannelHeaderView()
                }
              
            }
            .listStyle(.grouped)
            .navigationTitle("Updates")
            .searchable(text: $searchText)
        }
        
    }
    private  struct ChannelHeaderView:View {
        var body: some View {
            HStack{
                Text("Channels")
                    .bold()
                    .font(.title3)
                    .textCase(nil)
                    .foregroundStyle(.black)
                Spacer()
                Button{
                    
                }label: {
                    Image(systemName: "plus")
                        .padding(7)
                        .background((Color(.systemGray5)))
                        .clipShape(Circle())
                }
                
            }
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
            .padding()
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 10,style:.continuous ))
        }
    }
    private struct StatusSection:View {
        var body: some View {
            HStack{
                Circle()
                    .frame(width: UpdatesTabScreen.Constant.imageDimension,height: UpdatesTabScreen.Constant.imageDimension)
                VStack(alignment:.leading) {
                 Text("My Status")
                        .font(.callout)
                        .bold()
                    Text("Add to my status")
                        .foregroundStyle(.gray)
                        .font(.system(size: 15))
                
                }
                Spacer()
                cameraButton()
                pencilButton()
            }
          
        }
        private func cameraButton() -> some View {
            Button {
                
            }label: {
                Image(systemName: "camera.fill")
                    .padding(10)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
                    .bold()
            }
        }
        private func pencilButton() -> some View {
            Button {
                
            }label: {
                Image(systemName: "pencil")
                    .padding(10)
                    .background(Color(.systemGray5))
                    .clipShape(Circle())
                    .bold()
            }
        }
    }
    
    private struct RceentUpdates:View{
        var body: some View {
                HStack{
                    Circle()
                        .frame(width: UpdatesTabScreen.Constant.imageDimension,height: UpdatesTabScreen.Constant.imageDimension)
                    
                    VStack(alignment:.leading) {
                     Text("Joseph Smith")
                            .font(.callout)
                            .bold()
                        Text("Ihr")
                            .foregroundStyle(.gray)
                            .font(.system(size: 15))
                    
                    }
                    Spacer()
                    
            }
        }
    }
    private struct ChannelListView:View {
        var body: some View {
            VStack(alignment:.leading){
               Text("Stay updates on topics that matter to you.Find channels to follow below.")
                    .foregroundStyle(.gray)
                    .font(.callout)
                    .padding(.horizontal)
                ScrollView(.horizontal,showsIndicators: false){
                    HStack{
                        ForEach(0..<10) {_ in
                            ChannelItemView()
                        }
                    }
                }
                Button("Explore more") {}
                    .tint(.blue)
                    .bold()
                    .buttonStyle(.borderedProminent)
                    .clipShape(Capsule())
                    .padding(.vertical)
            }
            }
        private struct ChannelItemView:View {
            var body: some View {
                VStack{
                    Circle()
                        .frame(width: UpdatesTabScreen.Constant.imageDimension,height: UpdatesTabScreen.Constant.imageDimension)
                    Text("Manchester United")
                    Button{
                        
                    }label: {
                        Text("Follow")
                            .bold()
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .background(Color.blue.opacity(0.2))
                            .clipShape(Capsule())
                    }
                    
                }
                .padding(.horizontal,16)
                .padding(.vertical)
                .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.systemGray4),lineWidth:1)
                )
            }
        }
        }
    
    
   
}

#Preview {
    UpdatesTabScreen()
}


extension UpdatesTabScreen {
    enum Constant {
        static let imageDimension:CGFloat = 55
    }
}
