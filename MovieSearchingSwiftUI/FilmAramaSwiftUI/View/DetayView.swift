//
//  DetayView.swift
//  FilmAramaSwiftUI
//
//  Created by Koray Urun on 12.10.2025.
//

import SwiftUI

struct DetayView: View {
    
    let imdbId: String
    
    @ObservedObject var filmDetayViewModel = FilmDetayViewModel()
    
    var body: some View {

        VStack(alignment: .leading, spacing: 5){
            
            HStack {
                Spacer()
                if let posterUrl = filmDetayViewModel.filmDetayi?.poster, !posterUrl.isEmpty {
                    OzelImage(url: posterUrl)
                        .frame(width : UIScreen.main.bounds.width * 0.6,height:UIScreen.main.bounds.height * 0.3,alignment: .center)
                } else {
                    Image("placeholder")
                        .resizable()
                        .frame(width : UIScreen.main.bounds.width * 0.6,height:UIScreen.main.bounds.height * 0.3,alignment: .center)
                }
                Spacer()

            }
            
            Text(filmDetayViewModel.filmDetayi?.title ?? "Film ismi gösterilecek")
                .font(.title).foregroundStyle(.blue).padding()
            
            Text(filmDetayViewModel.filmDetayi?.plot ?? "Film plotu gösterilecek")
                .padding()
            
            Text("Yönetmen: \(filmDetayViewModel.filmDetayi?.director ?? "Yönetmen gösterilecek") ")
                .padding()
            
            Text("Yazar: \(filmDetayViewModel.filmDetayi?.writer ?? "Yazar gösterilecek") ")
                .padding()
            
            Text("Ödüller: \(filmDetayViewModel.filmDetayi?.awards ?? "Ödülleri gösterilecek") ")
                .padding()
            
            Text("Yıl: \(filmDetayViewModel.filmDetayi?.year ?? "Yıl gösterilecek") ")
                .padding()
            
            
            
            Spacer()
        }.onAppear(perform: {
            
            
            self.filmDetayViewModel.filmDetayiAl(imdbId:imdbId)
            
        })


    }
}

#Preview {
    DetayView(imdbId: "test")
}
