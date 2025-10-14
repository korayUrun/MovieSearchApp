//
//  DownloaderClient.swift
//  FilmAramaSwiftUI
//
//  Created by Koray Urun on 12.10.2025.
//
import Foundation

class DownloaderClient{
    
    
    func filmlerIndir(search : String, completion : @escaping (Result<[Film]?,DownloaderError >) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?s=\(search)&apikey=9dce6d0b") else {
            return completion(.failure(.yanlisUrl))
            
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else{
                return completion(.failure(.veriGelmedi))
            }
            
            guard let filmCevabi = try? JSONDecoder().decode(GelenFilmler.self,from: data) else {
                return completion(.failure(.veriIslenmedi))
                            
        }
        
            completion(.success(filmCevabi.filmler))
            
        }.resume()
        
        
    }
    
    func filmDetayiniIndir(imdbId : String, completion : @escaping (Result<FilmDetay,DownloaderError>) -> Void){
        
        guard let url = URL(string: "https://www.omdbapi.com/?i=\(imdbId)&apikey=9dce6d0b") else {
            return completion(.failure(.yanlisUrl))
            
        }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data , error == nil else{
                return completion(.failure(.veriGelmedi))
            }
            
            guard let gelenFilmDetayi = try? JSONDecoder().decode(FilmDetay.self,from: data) else {
                return completion(.failure(.veriIslenmedi))
                            
        }
        
            completion(.success(gelenFilmDetayi))
            
        }.resume()
        
        
    }
    
}

enum DownloaderError : Error{
    case yanlisUrl
    case veriGelmedi
    case veriIslenmedi
}
