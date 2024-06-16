//
//  MessageListView.swift
//  WhatApp
//
//  Created by MacBook AIR on 16/06/2024.
//

import SwiftUI

struct MessageListView: UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: MessageListControllerViewController, context: Context) {
        
    }
    
    typealias UIViewControllerType = MessageListControllerViewController
    
    func makeUIViewController(context: Context) -> MessageListControllerViewController {
        let messageListControllerViewController = MessageListControllerViewController()
        return messageListControllerViewController
    }
    
   
   
}

#Preview {
    MessageListView()
}
