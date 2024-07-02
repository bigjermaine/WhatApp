//
//  SignUpScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 30/06/2024.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(\.dismiss) private var dimiss
    @EnvironmentObject private var authScreenModel:AuthScreenViewModel
    var body: some View {
        VStack{
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text:$authScreenModel.email)
            AuthTextField(type: AuthTextField.InputType.custom("Username", "at"), text: $authScreenModel.username)
            AuthTextField(type: .password, text: $authScreenModel.password)
            AuthButton(title: "Create an Account") {
                Task { await authScreenModel.handleSignUp()}
            }
            .disabled(authScreenModel.disableSignuputton)
            Spacer()
            backButton()
                .padding(.bottom,20)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
        .background{
            LinearGradient(colors: [.green,.green.opacity(0.8),.teal], startPoint: .top, endPoint: .bottom)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
        .alert(isPresented: $authScreenModel.errorState.showError, content: {
            Alert(title: Text(authScreenModel.errorState.errorMessage),dismissButton: .default(Text("Ok")))
        })
    }
    private func  backButton() -> some View {
        Button{
         dimiss()
        }label: {
            HStack{
                Image(systemName: "sparkles")
                Text("Already Created An Account ?")
                +
                Text("Signin")
                    .bold()
               
                Image(systemName: "sparkles")
            }
            .foregroundColor(.white)
        }
    }
}

#Preview {
    SignUpScreen()
        
}
