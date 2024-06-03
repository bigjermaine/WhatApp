//
//  SettingItemView.swift
//  WhatApp
//
//  Created by MacBook AIR on 03/06/2024.
//

import SwiftUI

struct SettingItemView: View {
    var body: some View {
        HStack{
           Image(systemName: "info.bubble.fill")
                .padding(3)
                .foregroundColor(.white)
                .background(Color.blue)
            Text("Chnage Profile Photo")
                .font(.system(size: 18))
        }
    }
}

#Preview {
    SettingItemView()
}
