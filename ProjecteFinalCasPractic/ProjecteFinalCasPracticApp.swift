//
//  ProjecteFinalCasPracticApp.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 23/11/26.
//

import SwiftUI

@main
struct ProjecteFinalCasPracticApp: App {
    @State private var songStore = SongStore()
    @State private var videoStore = VideoStore()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(songStore)
                .environment(videoStore)
        }
    }
}
