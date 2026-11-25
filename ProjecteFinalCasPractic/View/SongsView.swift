//
//  SongsView.swift
//  ProjecteFinalCasPractic
//
//  Created by Laia (user306329) on 11/25/26.
//

import SwiftUI

struct SongsView: View {
    @Environment(SongStore.self) private var songStore
    
    var body: some View {
        VStack {
            switch(songStore.state){
            case .idle:
                Button("Get data cambio test"){
                    songStore.getDataFromAPI()
                }
            case .loading:
                ProgressView()
            case .loaded(let songs):
                List(songs){song in
                    Text(song.trackName)
                }
            case .error(let errorMessage):
                Text(errorMessage)
            }
        }
        

    }
}

#Preview {
    SongsView()
}
