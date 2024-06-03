//
//  MainTabView.swift
//  WhatApp
//
//  Created by MacBook AIR on 22/05/2024.
//

import SwiftUI

struct MainTabView: View {
    init() {
        makeTabbarOpaque()
    }
    var body: some View {
        TabView{
            UpdatesTabScreen()
            .tabItem {
                Image(systemName: Tab.update.icon)
                Text(Tab.update.title)
                
            }
            CallsTabScreen()
            .tabItem {
                Image(systemName: Tab.calls.icon)
                Text(Tab.calls.title)
                
            }
            CommunityTabScreen()
            .tabItem {
                Image(systemName: Tab.communities.icon)
                Text(Tab.communities.title)
                
            }
            ChatTabbarView()
            .tabItem {
                Image(systemName: Tab.chats.icon)
                Text(Tab.chats.title)
                
            }
            SettingsTabScreen()
            .tabItem {
                Image(systemName: Tab.settings.icon)
                Text(Tab.settings.title)
                
            }
        }
    }
    
    // Note:prevent the tabbar from been opaqque 
    private func makeTabbarOpaque() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        
    }
}

extension MainTabView {
    private enum Tab:String{
        case update, calls, communities, chats,settings
        fileprivate var title:String{
            return rawValue.capitalized
        }
        fileprivate var icon:String {
            switch self {
            case .update:
                return "circle.dashed.inset.filled"
            case .calls:
                return "phone"
            case .communities:
                return "person.3"
            case .chats:
                return "message"
            case .settings:
                return "gear"
            }
        }
    }
}
#Preview {
    MainTabView()
}
