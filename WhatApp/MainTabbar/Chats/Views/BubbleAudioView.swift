//
//  BubbleAudioView.swift
//  WhatApp
//
//  Created by MacBook AIR on 27/06/2024.
//

import SwiftUI

struct BubbleAudioView: View {
    let item:MessageItem
    @State private var sliderValue:Double = 0
    @State private var sliderRange:ClosedRange<Double> = 0...20
    var body: some View {
        VStack(alignment: .leading, spacing:3){
            HStack{
                playButton()
                Slider(value: $sliderValue,in: sliderRange)
                    .tint(.gray)
                Text("04:00")
                    .foregroundStyle(.gray)
                
            }
            .padding(20)
            .background(Color.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .padding(5)
            .background(item.backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .applyTail(item.direction)
            
            timeStampTextView()
        }
        .shadow(color:Color(.systemGray3), radius:5)
        .frame(maxWidth: .infinity,alignment: item.alignment)
        .padding(.leading,item.direction == .received ? 5 : 100)
        .padding(.trailing,item.direction == .received ? 100 : 5)
        
    }
    
    private func timeStampTextView() -> some View {
        HStack{
            Text("3:05 PM")
                .font(.system(size: 13))
                .foregroundStyle(.gray)
            if item.direction == .sent {
                Image(.seen)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 15,height: 15)
                    .foregroundStyle(Color(.systemRed ))
            }
        }
    }
    private func playButton() -> some View {
        Button{
            
        }label: {
            Image(systemName: "play.fill")
                .padding(10)
                .background(item.direction == .received ? .green : .white)
                .clipShape(Circle())
                .foregroundStyle(item.direction == .received ? .white : .black)
        }
    }
}

#Preview {
    BubbleAudioView(item: .sentPlaceHolder)
        .padding()
}
