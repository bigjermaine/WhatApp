//
//  MessageItem.swift
//  WhatApp
//
//  Created by MacBook AIR on 20/06/2024.
//

import Foundation


struct MessageItem:Identifiable {
    let id = UUID().uuidString
    let text:String
    let direction:MessageDirection
}


enum MessageDirection {
    case sent, received
    
    static var random:MessageDirection {
        return [MessageDirection.sent,.received].randomElement() ?? .sent
    }
}
