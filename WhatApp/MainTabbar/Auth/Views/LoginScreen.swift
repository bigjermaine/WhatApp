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
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text: .constant(""))
            AuthTextField(type: .password, text: .constant(""))
            ForgptPasswordButton()
            AuthButton(title: "Log in now") {
                
            }
            Spacer()
            signUpButton()
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
        NavigationLink{
          Text("Sign UP View Placveholder")
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
