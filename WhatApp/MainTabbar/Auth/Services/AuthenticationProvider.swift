//
//  AuthenticationProvider.swift
//  WhatApp
//
//  Created by MacBook AIR on 01/07/2024.
//

import Foundation
import Combine
import FirebaseAuth
import FirebaseDatabase


enum AuthState {
    case pending, loggedin(UserItem), loggedOut
}
protocol AuthProvider {
    static var shared:AuthProvider{get}
    var authState:CurrentValueSubject<AuthState, Never> {get}
    func login(with wmail:String, and password:String) async throws
    func creatAccount(for usernane:String, with email:String, and password:String) async throws
    func logOut() async throws
}

enum AuthError:Error {
    case accountCreationField(_ description:String)
    case failedToSaveUserDefault(_ description:String)
    
    var errorDescription:String? {
        switch self{
        case .accountCreationField(let description):
            return description
        case .failedToSaveUserDefault(let description):
            return description
        }
    }
}
  final class AuthManager:AuthProvider {
    static let shared: AuthProvider = AuthManager()
    
    var authState = CurrentValueSubject<AuthState,Never>(.pending)
    
    func login(with wmail: String, and password: String) async throws {
        
    }
    
    func creatAccount(for userName: String, with email: String, and password: String) async throws {
        do{
            let authResult = try await Auth.auth().createUser(withEmail: email, password: password)
            let uid = authResult.user.uid
            let newUser = UserItem(uid: uid, username: userName, email: email)
            try await saveUserInfoDatabase(user: newUser)
            self.authState.send(.loggedin(newUser))
        }catch let error{
            throw AuthError.accountCreationField(error.localizedDescription)
        }
    }
    
    func logOut() async throws {
        
    }
      
      func autoLogin() async {
          if Auth.auth().currentUser == nil {
              authState.send(.loggedOut)
          }else {
              Task{
                  authState.send(.loggedin(<#T##UserItem#>))
              }
          }
          
      }
      private func fetchCurrentUserInfo() async {
          guard let currentUid = Auth.auth().currentUser?.uid else {return }
      await Database.database().reference().child("users").child(currentUid).observe(.value){ snapShot in
              
          }withCancel: { error in
              print(error.localizedDescription)
          }
      }
      
      
      
}


extension AuthManager {
    private func saveUserInfoDatabase(user:UserItem) async throws {
        do{
            let userDictionary = ["uid":user.uid,"username":user.username,"email":user.email]
            try await Database.database().reference().child("users").child(user.uid).setValue(userDictionary)
        }catch{
            throw AuthError.accountCreationField(error.localizedDescription)
        }
    }
}



struct UserItem:Identifiable,Hashable,Decodable{
    let uid:String
    let username:String
    let email:String
    var bio:String? = nil
    var profileImageUrl:String? = nil
    
    var id:String {
        return uid
    }
    
    var bioUnwrapped:String{
        return bio ?? "Hey there i am using Whatapp"
    }
}
