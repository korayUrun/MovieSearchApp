//
//  ContentView.swift
//  FilmAramaSwiftUI
//
//  Created by Koray Urun on 12.10.2025.
//

import SwiftUI

struct FilmListeView: View {
    
    @ObservedObject var filmListeViewModel : FilmListeViewModel
    @State var aranacakFilm = ""
    
    var body: some View {
        NavigationView{
            
            VStack{
                
                TextField("Aranacak Film", text: $aranacakFilm) {
                    self.filmListeViewModel.filmAramasiYap(filmIsmi: aranacakFilm.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? aranacakFilm)
                }
                .padding().textFieldStyle(RoundedBorderTextFieldStyle())
                
                
                List(filmListeViewModel.filmler, id: \.imdbId){ film in
                    
                    NavigationLink(destination: DetayView(imdbId: film.imdbId), label: {
                        
                        HStack(){
                            
                            OzelImage(url: film.poster)
                                .frame(width: 90, height: 130)
                            
                            
                            VStack(alignment: .leading){
                                Text(film.title)
                                    .font(.title3)
                                    .foregroundStyle(.blue)
                                
                                Text(film.year)
                                    .foregroundStyle(.orange)
                                
                                
                            }
                            
                            
                        }
                    })
                    
                    
                    
                    
                    
                }.navigationTitle(Text("Film Kitabı"))
                
            }
        }
        
    }
}

//#Preview {
    //FilmListeView()
//}
