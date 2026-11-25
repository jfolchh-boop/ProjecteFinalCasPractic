//
//  ContentView.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 23/11/26.
//
import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
        TabView {
            //Text("Pantalla principal")
            NavigationStack {
                SongsView()
                    .navigationTitle("Songs")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Songs", systemImage: "music.note.list")
            }
            		
            NavigationStack {
                //Text("Pantalla de perfil")
                VideosView()
                    .navigationTitle("Music Videos")
                    .navigationBarTitleDisplayMode(.inline)
                
            }
            .tabItem {
                Label("Music Videos", systemImage: "video")
            }
        }
        /*
        .padding()
         */
    }
}

#Preview {
    ContentView()
        .environment(SongStore())
        .environment(VideoStore())
}

