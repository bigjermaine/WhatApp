//
//  LoginScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 28/06/2024.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var authScrennModel = AUthScrennModel()
    var body: some View {
        VStack{
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text: $authScrennModel.email)
            AuthTextField(type: .password, text: $authScrennModel.password)
            ForgptPasswordButton()
            AuthButton(title: "Log in now") {
                
            }
            .disabled(authScrennModel.disableLoginButton)
            Spacer()
            signUpButton()
                .padding(.bottom,20)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background(Color.teal.gradient)
        .ignoresSafeArea()
    }
    
    private func ForgptPasswordButton() -> some View {
        Button{
            
        }label: {
            Text("forgot password ?")
                .foregroundStyle(.white)
                .frame(maxWidth:.infinity,alignment: .trailing)
                .padding(.trailing,32)
                .bold()
                .padding(.vertical)
        }
    }
      
    private func signUpButton() -> some View {
        NavigationLink {
           SignUpScreen()
                .environmentObject(authScrennModel)
        }label: {
            HStack{
                Image(systemName: "sparkles")
                Text("Dont have an account ?")
                +
                Text("Create one")
                    .bold()
               
                Image(systemName: "sparkles")
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    LoginScreen()
}
