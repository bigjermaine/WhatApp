//
//  AuthenticationProvider.swift
//  WhatApp
//
//  Created by MacBook AIR on 01/07/2024.
//

import Foundation
import Combine
enum AuthState {
    case pending, loggedin, loggedOut
}
protocol AuthProvider {
    static var shared:AuthProvider{get}
    var authState:CurrentValueSubject<AuthState, Never> {get}
    func login(with wmail:String, and password:String) async throws
    func creatAccount(for usernane:String, with email:String, and password:String) async throws
    func logOut() async throws
}
