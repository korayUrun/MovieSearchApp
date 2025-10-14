//
//  ImageDownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Koray Urun on 12.10.2025.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    @Published var indirilenGorsel : Data?
    
    func gorselIndir(url : String){
        
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            
            guard let data = data , error == nil else { return }
            
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
            
            
        }.resume()
        
    }
    
}
