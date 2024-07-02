//
//  WhatAppApp.swift
//  WhatApp
//
//  Created by MacBook AIR on 22/05/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseAppCheck
@main
struct WhatAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                LoginScreen()
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate{
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {

      FirebaseApp.configure()
    return true
      
     
  }
    
   
}
class YourAppCheckProviderFactory: NSObject, AppCheckProviderFactory {
    func createProvider(with app: FirebaseApp) -> AppCheckProvider? {
        return AppAttestProvider(app: app)
    }
}
