//
//  TextInputArea.swift
//  WhatApp
//
//  Created by MacBook AIR on 16/06/2024.
//

import SwiftUI

struct TextInputArea: View {
    @State private var text = ""
    var body: some View {
        HStack(alignment: .bottom,spacing: 5){
            imagePickerButton()
            audioRecordedButton()
            messageTextfield()
            sendMessgaeButton()
            
        }
        .padding()
        .background(.whatsAppWhite)
    }
    
    private func imagePickerButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "photo.on.rectangle")
                .font(.system(size: 22))
        }
        
    }
    
    private func sendMessgaeButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "arrow.up")
                .fontWeight(.heavy)
                .foregroundStyle(.white)
                .padding(6)
                .background(Color.blue)
                .clipShape(Circle())
        }
        
    }
    private func audioRecordedButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "mic.fill")
                .fontWeight(.heavy)
                .imageScale(.small)
                .foregroundStyle(.white)
                .padding(6)
                .background(.blue)
                .clipShape(Circle())
                .padding(.horizontal, 3)
        }
    }
    private func messageTextfield() -> some View {
        TextField("",text:$text,axis:.vertical)
            .padding(5)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(.thinMaterial)
            
            )
            .overlay(textViewBorder())
    }
    
    private func textViewBorder() -> some View {
        RoundedRectangle(cornerRadius: 20, style: .continuous).stroke(Color(.systemGray6),lineWidth: 1)
    }
}

#Preview {
    TextInputArea()
}
