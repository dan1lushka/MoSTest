//
//  MovieListManager.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

class MovieListManager: ObservableObject {
    
    @Published var idbResponse = IDBResponse(items: [Item](), errorMessage: "")
    var images = [UIImage]()
    
    init() {
        loadMovies()
    }
    
    func loadMovies() {
        
        guard let url = URL(string: "https://imdb-api.com/en/API/Top250Movies/k_x3hy019r") else {
            fatalError("invalid URL string")
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(IDBResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.idbResponse = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

