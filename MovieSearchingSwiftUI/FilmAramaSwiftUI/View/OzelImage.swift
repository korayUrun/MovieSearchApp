//
//  OzelImageView.swift
//  FilmAramaSwiftUI
//
//  Created by Koray Urun on 12.10.2025.
//

import SwiftUI

struct OzelImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    var body: some View {
        Group {
            if let data = self.imageDownloaderClient.indirilenGorsel {
                Image(uiImage: UIImage(data: data)!)
                    .resizable()
            } else {
                Image("placeholder")
                    .resizable()
            }
        }
        .onAppear {
            self.imageDownloaderClient.gorselIndir(url: url)
        }
    }
}

//#Preview {
//    OzelImageView()
//}
