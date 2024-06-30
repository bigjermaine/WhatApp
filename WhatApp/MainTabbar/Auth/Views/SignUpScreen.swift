//
//  SignUpScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 30/06/2024.
//

import SwiftUI

struct SignUpScreen: View {
    var body: some View {
        VStack{
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text: .constant(""))
            AuthTextField(type: AuthTextField.InputType.custom("Username", "at"), text: .constant(""))
            AuthTextField(type: .password, text: .constant(""))
            AuthButton(title: "Create an Account") {
                
            }
            Spacer()
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background{
            LinearGradient(colors: [.green,.green.opacity(0.8),.teal], startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SignUpScreen()
}
