//
//  AuthHeaderView.swift
//  WhatApp
//
//  Created by MacBook AIR on 28/06/2024.
//

import SwiftUI

struct AuthHeaderView: View {
    var body: some View {
        HStack{
            Image(.whatsapp)
                .resizable()
                .frame(width: 40,height: 40)
            
            
            Text("whatApp")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    AuthHeaderView()
}
