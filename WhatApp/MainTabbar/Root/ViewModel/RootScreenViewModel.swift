//
//  RootScreenModel.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import Foundation
import Combine

class RootScreenViewModel:ObservableObject {
    @Published  var authState = AuthState.pending
    private var cancallable:AnyCancellable?
    
    init() {
        cancallable =   AuthManager.shared.authState.receive(on: DispatchQueue.main)
            .sink { [weak self] latestAuthSate in
                self?.authState = latestAuthSate
            }
     }
    
}
