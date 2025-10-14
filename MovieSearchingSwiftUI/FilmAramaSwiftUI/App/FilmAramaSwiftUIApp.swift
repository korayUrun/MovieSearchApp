//
//  FilmAramaSwiftUIApp.swift
//  FilmAramaSwiftUI
//
//  Created by Koray Urun on 12.10.2025.
//

import SwiftUI

@main
struct FilmAramaSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            FilmListeView(filmListeViewModel: FilmListeViewModel.init())
        }
    }
}
