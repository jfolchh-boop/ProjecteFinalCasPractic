//
//  TrackView.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 25/11/26.
//



import SwiftUI

struct TrackView: View {
    @Environment(TrackStore.self) private var trackStore
    var body: some View {
        VStack {
            switch(trackStore.state){
                case .idle:
                    Button("Get data cambio test"){
                        trackStore.getDataFromAPI()
                    }
                    .buttonStyle(PlainButtonStyle())
                
                case .loading:
                    ProgressView()
                case .loaded(let tracks):
                List(tracks){track in
                    Text("\(track.trackName)")
                }
                case .error(let errorMessage):
                    Text(errorMessage)
            }
            
        }
        .padding()
    }
}

#Preview {
    TrackView()
        .environment(TrackStore())
}

