//
//  ArtyApp.swift
//  Arty
//
//  Created by Cyboticx LLC on 08/07/2023.
//

import SwiftUI

@main
struct ArtyApp: App {
    @StateObject private var appViewModel: AppViewModel = AppViewModel();
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(appViewModel)
        }
    }
}
