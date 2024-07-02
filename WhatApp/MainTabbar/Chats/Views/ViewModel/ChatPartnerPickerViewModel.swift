//
//  ChatPartnerPickerViewModel.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import Foundation

enum ChannelCreateRoute{
    case addGroupChat
    case setupGroupChat
}
final class ChatPartnerPickerViewModel:ObservableObject {
    
    @Published var navStack = [ChannelCreateRoute]()
    
    
}

