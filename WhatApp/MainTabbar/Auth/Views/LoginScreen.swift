//
//  LoginScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 28/06/2024.
//

import SwiftUI

struct LoginScreen: View {
    var body: some View {
        VStack{
            AuthHeaderView()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.teal.gradient)
        .ignoresSafeArea()
    }
}

#Preview {
    LoginScreen()
}
