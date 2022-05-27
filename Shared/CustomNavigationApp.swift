//
//  CustomNavigationApp.swift
//  Shared
//
//  Created by Micah Kimel on 5/27/22.
//

import SwiftUI

@main
struct CustomNavigationApp: App {
    var body: some Scene {
        WindowGroup {
                ContentView()
                .environmentObject(GlobalClass())
        }
    }
}
