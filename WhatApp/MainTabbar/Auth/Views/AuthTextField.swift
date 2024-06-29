//
//  AuthTextField.swift
//  WhatApp
//
//  Created by MacBook AIR on 28/06/2024.
//

import SwiftUI

struct AuthTextField: View {
    let type:InputType
    @Binding var text:String
    var body: some View {
        HStack{
            Image(systemName: type.imageName)
                .fontWeight(.semibold)
                .frame(width: 30)
            switch type {
            case.password:
                SecureField( type.placeHolder, text: $text)
            default:
                TextField(type.placeHolder,text:$text)
            }
        }
        .foregroundStyle(.white)
        .padding()
        .background(Color.white.opacity(0.3))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding(.horizontal,32)
    }
}
extension AuthTextField {
    enum InputType {
        case email
        case password
        case custom(_ placeholder: String, _ iconName:String)
        var placeHolder:String {
            switch self {case .email:
                return "Email"
            case .password:
                return "Password"
            case .custom(let placeholder, _):
                return placeholder
            }
        }
        var imageName:String{
            switch self{
            
            case .email:
                return "envelope"
            case .password:
                return "lock"
            case .custom(_, let iconName):
                return iconName
            }
        }
        var keyBoardType:UIKeyboardType {
            switch self{
                
            case .email:
                return .emailAddress
            case .password:
                return .default
            case .custom(_, _):
                return  .default
            }
        }
        
    }
}





#Preview {
    AuthTextField(type: .email, text: .constant(""))
}
