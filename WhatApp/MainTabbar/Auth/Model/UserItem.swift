//
//  UserItem.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import Foundation

struct UserItem:Identifiable,Hashable,Decodable{
    let uid:String
    let username:String
    let email:String
    var bio:String? = nil
    var profileImageUrl:String? = nil
    
    var id:String {
        return uid
    }
    
    var bioUnwrapped:String{
        return bio ?? "Hey there i am using Whatapp"
    }
}


extension UserItem {
    init(dictionary: [String:Any]){
        self.uid = dictionary[.uid] as? String ?? ""
        self.username =  dictionary[.username] as? String ?? ""
        self.email = dictionary[.email] as? String ?? ""
        self.bio  =  dictionary[.bio] as? String ?? ""
        self.profileImageUrl  =  dictionary[.profileImageUrl] as? String ?? ""
    }
}


extension String {
    static let uid = "uid"
    static let username = "username"
    static let email = "email"
    static let bio = "bio"
    static let profileImageUrl = "profileImageUrl"
}
