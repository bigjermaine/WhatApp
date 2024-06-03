//
//  SettingItemView.swift
//  WhatApp
//
//  Created by MacBook AIR on 03/06/2024.
//

import SwiftUI

struct SettingItemView: View {
    let Item:SettingsItem
    var body: some View {
        HStack{
            switch Item.imageType {
            case .systemImage:
                Image(systemName: Item.imageName)
                    .padding(3)
                    .foregroundColor(.white)
                    .background(Item.backgroundColor)
            case .assetImage:
                Image(systemName: Item.imageName)
                    .padding(3)
                    .foregroundColor(.white)
                    .background(Item.backgroundColor)
            }
            
            Text(Item.title)
                .font(.system(size: 18))
        }
    }
}

#Preview {
    SettingItemView(Item: .account)
}
