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
    case failedToSignIn(_ description:String)
    var errorDescription:String? {
        switch self{
        case .accountCreationField(let description):
            return description
        case .failedToSaveUserDefault(let description):
            return description
        case .failedToSignIn(let description):
            return description
        }
    }
}


final class AuthManager:AuthProvider {
    
    static let shared: AuthProvider = AuthManager()
    
    var authState = CurrentValueSubject<AuthState,Never>(.pending)
    
    private init() {
        Task{
            await autoLogin()
        }
    }
    
    func login(with email: String, and password: String) async throws {
        do {
            let authResult =  try await Auth.auth().signIn(withEmail: email, password: password)
            fetchCurrentUserInfo()
        }catch{
            throw AuthError.accountCreationField(error.localizedDescription)
        }
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
        do {
            try Auth.auth().signOut()
            authState.send(.loggedOut)
        }catch{
            throw AuthError.failedToSignIn(error.localizedDescription)
        }
    }
    
    func autoLogin() async {
        if Auth.auth().currentUser == nil {
            authState.send(.loggedOut)
        }else {
            fetchCurrentUserInfo()
        }
        
    }
    
    
    private func fetchCurrentUserInfo()  {
        guard let currentUid = Auth.auth().currentUser?.uid else {
            return
        }
        FireBaseConstants.UserRef.child(currentUid).observe(.value){ snapShot in
            guard let userDict =  snapShot.value as? [String:Any] else {
                return
            }
            let loggedInUser = UserItem(dictionary: userDict)
            self.authState.send(.loggedin(loggedInUser))
        }withCancel: { error in
            print(error.localizedDescription)
        }
    }
    
    
    
}

extension AuthManager {
    private func saveUserInfoDatabase(user:UserItem) async throws {
        do{
            let userDictionary: [String:Any]  = [.uid:user.uid,.username:user.username,.email:user.email]
            try await    FireBaseConstants.UserRef.child(user.uid).setValue(userDictionary)
        }catch{
            throw AuthError.accountCreationField(error.localizedDescription)
        }
    }
}




