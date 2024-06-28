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
    let type:MessageType
    let direction:MessageDirection
    static let sentPlaceHolder = MessageItem(text: "Holy spagehetti", type: .text, direction: .sent)
    static let receivePlaceHolder = MessageItem(text: "Holy spagehetti", type: .text, direction: .received)
    
    var backgroundColor:Color {
        return direction  == .sent ? .bubbleGreen : .bubbleWhite
        
    }
    
    var alignment:Alignment {
        return direction == .received ? .leading :.trailing
    }
    
    static let stubMessages:[MessageItem] = [
        .init(text: "Hi There", type: .text, direction: .sent),
        .init(text: "Check Out This Photo", type: .photo, direction: .received),
        .init(text: "Check Out This Photo", type: .video, direction: .sent),
        .init(text: "", type: .audio, direction: .sent),
    ]
}

enum MessageType {
    case text, photo, video, audio
}

enum MessageDirection {
    case sent, received
    
    static var random:MessageDirection {
        return [MessageDirection.sent,.received].randomElement() ?? .sent
    }
}
