 //
//  AuthButton.swift
//  WhatApp
//
//  Created by MacBook AIR on 30/06/2024.
//

import SwiftUI

struct AuthButton: View {
    let title:String
    let enter: () -> Void
    @Environment(\.isEnabled) private var isEnabled
    private var backgroundColor:Color {
        return isEnabled ? Color.white : Color.white.opacity(0.3)
    }
    
    private var textColor:Color {
        return isEnabled ? Color.green : Color.white.opacity(0.3)
    }
    var body: some View {
        Button{
            enter()
        }label: {
            HStack{
                Text("Login")
                Image(systemName: "arrow.right")
            }
            .font(.headline)
            .foregroundStyle(textColor)
            .padding()
            .frame(maxWidth:.infinity)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            .shadow(color:.green.opacity(0.2), radius: 10.0)
            .padding(.horizontal,32)
        }
    }
}

#Preview {
    ZStack{
        AuthButton(title:"Login") {
            
        }
    }
    
}
