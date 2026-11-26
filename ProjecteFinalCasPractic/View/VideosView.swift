//
//  VideosView.swift
//  ProjecteFinalCasPractic
//
//  Created by Laia (user306329) on 11/25/26.
//

import SwiftUI

struct VideosView: View {
    @Environment(VideoStore.self) private var videoStore
    
    var body: some View {
        VStack {
            switch(videoStore.state){
            case .idle:
                Button("Get data cambio test"){
                    videoStore.getDataFromAPI(term:"Adele")
                }
            case .loading:
                ProgressView()
            case .loaded(let videos):
                List(videos){video in
                    HStack {
                        AsyncImage(url: URL(string: video.artworkUrl!)) //falta gestionar les tres fases i controlar correctament l'optional amb optional binging
                        VStack {
                            //apareix centrat. s'ha de formatar correctament.
                            Text(video.trackName)
                            Text(video.artistName)
                            if let milliseconds = video.trackTimeMillis {
                                let totalSeconds = milliseconds / 1_000 //ho passem a segons
                                let minutes = totalSeconds / 60 //obtenim els minuts dividint entre 60
                                let seconds = totalSeconds % 60 //obtenim els segons restants amb el resto
                                Text("\(minutes):\(seconds)")
                               // Text(String(format: "%d:%02d", minutes, seconds))
                            } else {
                                Text("Temps no obtingut")
                                //aquí estaria bé ficar un error d'aquests genérics
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
    VideosView().environment(VideoStore())
}
