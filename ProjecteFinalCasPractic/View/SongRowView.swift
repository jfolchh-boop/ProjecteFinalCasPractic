//
//  SongRowView.swift
//  ProjecteFinalCasPractic
//
//  Created by Laia (user306329) on 11/26/26.
//

import SwiftUI

struct SongRowView: View {
    private let imageSize: CGFloat = 90
    let song: Track
    
    var body: some View {
        HStack (spacing: 15){
            if let caratula=song.artworkUrl, //Revisa que artworkUrl no sigui nil.
               let url = URL(string: caratula){ //Comprova que artworkUrl es pugui convertir en URL
                AsyncImage(url: url){ phase in
                    //SwiftUI ens proporciona un tipus anomenat AsyncImagePhase que ens permet saber en quin estat es troba la càrrega de la imatge.
                    //Aquest tipus és un enum amb tres casos: .empty, .success(Image) i .failure.
                    //El paràmetre phase és de tipus AsyncImagePhase.
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width:imageSize, height:imageSize)

                    case .success(let image):
                        image
                            .resizable() //Permet redimensionar la imatge.
                            .scaledToFill() //Omple l'espai disponible mantenint les proporcions, encara que sobresurti.
                            .frame(width:imageSize, height:imageSize) //Defineix les dimensions del marc.
                            .clipped() //Retalla la part de la imatge que sobresurt del marc.
                            .cornerRadius(10) //Arrodoneix les cantonades.

                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .frame(width:imageSize, height:imageSize)

                    @unknown default:
                        //Ens permet gestionar possibles casos nous que Apple pugui incorporar en futures versions de SwiftUI.
                        EmptyView()
                    }
                }
            }else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width:imageSize, height:imageSize)
            }
                
            VStack (alignment: .leading){
                //apareix centrat. s'ha de formatar correctament.
                Text(song.trackName)
                    .font(.headline.bold())
                Text(song.artistName)
                    .font(.subheadline)
                if let album=song.collectionName {
                    Text(album)
                        .font(.subheadline.italic())
                }else {
                    Text("No album")
                }
            }
            //.padding()
            Spacer()
        }
        //.padding()
        //Spacer()
    }
}

#Preview {
    SongRowView(song: Track(id: 1,
                            trackName: "Bohemian Rhapsody",
                            artistName: "Queen",
                            primaryGenreName: nil,
                            releaseDate: nil,
                            collectionName: "A Night at the Opera",
                            trackTimeMillis: nil,
                            trackPrice: nil,
                            currency: nil,
                            artworkUrl: nil,
                            previewUrl: nil))
}
