//
//  SignUpScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 30/06/2024.
//

import SwiftUI

struct SignUpScreen: View {
    @Environment(\.dismiss) private var dimiss
    @EnvironmentObject private var authScrennModel:AUthScrennModel
    var body: some View {
        VStack{
            Spacer()
            AuthHeaderView()
            AuthTextField(type: .email, text:$authScrennModel.email)
            AuthTextField(type: AuthTextField.InputType.custom("Username", "at"), text: $authScrennModel.username)
            AuthTextField(type: .password, text: $authScrennModel.password)
            AuthButton(title: "Create an Account") {
                Task { await authScrennModel.handleSignUp()}
            }
            .disabled(authScrennModel.disableSignuputton)
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
let authScrennModel = AUthScrennModel()
#Preview {
    SignUpScreen()
        .environmentObject(authScrennModel)
}
