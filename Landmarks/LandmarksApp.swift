//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by Felipe Christian Lautenschlager on 26/04/2023.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
