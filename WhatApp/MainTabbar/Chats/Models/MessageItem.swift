//
//  MessageItem.swift
//  WhatApp
//
//  Created by MacBook AIR on 20/06/2024.
//

import Foundation
import SwiftUI

struct MessageItem:Identifiable {
    let id = UUID().uuidString
    let text:String
    let direction:MessageDirection
    static let sentPlaceHolder = MessageItem(text: "Holy spagehetti", direction: .sent)
    static let receivePlaceHolder = MessageItem(text: "Holy spagehetti", direction: .received)
    
    var backgroundColor:Color {
        return direction  == .sent ? .bubbleGreen : .bubbleWhite
        
    }
}


enum MessageDirection {
    case sent, received
    
    static var random:MessageDirection {
        return [MessageDirection.sent,.received].randomElement() ?? .sent
    }
}
