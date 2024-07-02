//
//  RootScreen.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import SwiftUI

struct RootScreen: View {
    @StateObject private var viewModel = RootScreenViewModel()
    var body: some View {
        switch viewModel.authState {
        case.pending:
            ProgressView()
                .controlSize(.large)
        case.loggedin(let loggedInUser):
          MainTabView(userItem: loggedInUser)
        case.loggedOut:
            LoginScreen()
        }
    }
}

#Preview {
    RootScreen()
}
