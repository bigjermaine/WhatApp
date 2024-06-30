//
//  AuthViewModel.swift
//  WhatApp
//
//  Created by MacBook AIR on 30/06/2024.
//

import Foundation

final class AUthScrennModel:ObservableObject {
   @Published var email = ""
   @Published var password = ""
   @Published var username = ""
   @Published  var isLoading = false
    
    var disableLoginButton:Bool {
        return email.isEmpty || password.isEmpty || isLoading
        
    }
    
    var disableSignuputton:Bool {
        return email.isEmpty || password.isEmpty || isLoading
        
    }
}
