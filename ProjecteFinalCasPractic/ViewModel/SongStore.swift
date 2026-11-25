//
//  SongStore.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 24/11/26.
//

import Observation
import Foundation

@Observable
class SongStore{
    private(set) var state = APIState.idle
    func getDataFromAPI(){
        state = APIState.loading
        Task{
            do{
                let tracks = try await APIService.fetchData(stringURL: "https://itunes.apple.com/search?term=rosalia&media=music&entity=song&limit=3")
                state = .loaded(tracks)
            }catch{
                state = .error(error.localizedDescription)
            }
        }
        
    }
}
