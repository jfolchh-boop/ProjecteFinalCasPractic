//
//  ContentView.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 23/11/26.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        //utilitzem tabviews per separar pestanyes i dins de cadascuna posarem el navigationstack, com a la practica de "libros"
        TabView {
            NavigationStack {
                TrackView()
                    .navigationTitle("Tracks")
            }
            .tabItem {
                //escollim una imatge classica de cançó
                Label("Tracks", systemImage: "music.note")
            }

            NavigationStack {
                Text("Aquí anirà el VideoclipView") //posarem aqui el VideoclipView
                    //.navigationTitle("Music Videos")
            }
            .tabItem {
                //escollim una imatge classica del play, es pot canviar si ens agrada un altre
                Label("Music Videos", systemImage: "play.rectangle")
            }
        }
    }
}

