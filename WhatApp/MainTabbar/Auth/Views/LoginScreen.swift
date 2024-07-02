//
//  LoginScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 28/06/2024.
//

import SwiftUI

struct LoginScreen: View {
    @StateObject private var authScreenModel = AuthScreenViewModel()
    var body: some View {
        VStack{
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text: $authScreenModel.email)
            AuthTextField(type: .password, text: $authScreenModel.password)
            ForgptPasswordButton()
            AuthButton(title: "Log in now") {
                Task{
                    await authScreenModel.handleLoginIn()
                }
            }
            .disabled(authScreenModel.disableLoginButton)
            Spacer()
            signUpButton()
                .padding(.bottom,20)
        }
        .alert(isPresented: $authScreenModel.errorState.showError, content: {
            Alert(title: Text(authScreenModel.errorState.errorMessage),dismissButton: .default(Text("Ok")))
        })
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
                .environmentObject(authScreenModel)
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
