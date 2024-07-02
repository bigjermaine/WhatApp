//
//  FireBaseConstants.swift
//  WhatApp
//
//  Created by MacBook AIR on 02/07/2024.
//

import Combine
import FirebaseAuth
import FirebaseDatabase

enum FireBaseConstants {
    private static let DatabaseRef =  Database.database().reference()
    static let UserRef = DatabaseRef.child("users")
}
