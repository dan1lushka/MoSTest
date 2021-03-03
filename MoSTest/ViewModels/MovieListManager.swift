//
//  MovieListManager.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

class MovieListManager: ObservableObject {
    
    @Published var imdbResponse = IMDBResponse(items: [Item](), errorMessage: "")

    var example: IMDBResponse {
        return IMDBResponse(items: [Item(id: "tt0111161", rank: "1", title: "aadada", fullTitle: "adawdawd", year: "1212", image: "square.fill", crew: "aaaa", imDbRating: "12", imDbRatingCount: "aa")], errorMessage: "")
    }
    
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
                if let decodedResponse = try? JSONDecoder().decode(IMDBResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.imdbResponse = decodedResponse
                    }
                    return
                }
            }
            print("Fetch failed \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            imdbResponse.items.remove(at: index)
        }
    }
    
    func move(indeces: IndexSet, newOffset: Int) {
        imdbResponse.items.move(fromOffsets: indeces, toOffset: newOffset)
    }
}

