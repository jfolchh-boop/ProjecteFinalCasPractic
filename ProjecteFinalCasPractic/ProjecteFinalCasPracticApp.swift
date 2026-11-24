//
//  ProjecteFinalCasPracticApp.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 23/11/26.
//

import SwiftUI

@main
struct ProjecteFinalCasPracticApp: App {
    @State private var trackStore = TrackStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(trackStore)
        }
    }
}
