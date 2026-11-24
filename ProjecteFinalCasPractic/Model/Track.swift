//
//  Track.swift
//  ProjecteFinalCasPractic
//
//  Created by Josep Folch on 24/11/26.
//

import Foundation

struct Track: Codable, Identifiable, Equatable {
    // No ens cal el trackId, amb id ja tenim suficient i agafem el trackId de JSON, pero hem d'usar codingkeys
    let id: Int
    let trackName, artistName: String

    // CodingKeys
    enum CodingKeys: String, CodingKey {
        case id = "trackId" // trackId -> id
        case trackName
        case artistName
    }
}

//hen de fer una nova estructura perque el JSON que torna itunes té primer informació sobre els resultats de cerca, la quantitat. I després anidat hi ha l'array de cançons
struct SearchResponse: Codable {
    let results: [Track]
}
