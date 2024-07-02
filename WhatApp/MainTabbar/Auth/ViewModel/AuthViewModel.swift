//
//  AuthViewModel.swift
//  WhatApp
//
//  Created by MacBook AIR on 30/06/2024.
//

import Foundation

@MainActor
final class AuthScreenViewModel:ObservableObject {
   @Published var email = ""
   @Published var password = ""
   @Published var username = ""
   @Published var isLoading = false
   @Published var errorState: (showError:Bool,errorMessage: String) = (false, "error")
    
    var disableLoginButton:Bool {
        return email.isEmpty || password.isEmpty || isLoading
        
    }
    
    var disableSignuputton:Bool {
        return email.isEmpty || password.isEmpty || isLoading
        
    }
    
    func handleSignUp() async {
        isLoading = true
        
        do {
            try await AuthManager.shared.creatAccount(for: username, with: email, and: password)
        }catch{
            errorState.errorMessage = "Failed to Create an Account \(error.localizedDescription)"
            errorState.showError = true
            isLoading = false
        }
    }
}
