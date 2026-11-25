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
                    HStack {
                        AsyncImage(url: URL(string: song.artworkUrl!)) //falta gestionar les tres fases i controlar correctament l'optional amb optional binging
                        VStack {
                            //apareix centrat. s'ha de formatar correctament.
                            Text(song.trackName)
                            Text(song.artistName)
                            if let album=song.collectionName {
                                Text(album)
                            }else {
                                Text("No album")
                            }
                        }
                    }
                }
            case .error(let errorMessage):
                Text(errorMessage)
            }
        }
        

    }
}

#Preview {
    SongsView().environment(SongStore())
}
