//
//  PhotoGoApp.swift
//  PhotoGo
//
//  Created by Yelim Kim on 3/6/24.
//

import SwiftUI

@main
struct PhotoGoApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
