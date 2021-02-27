//
//  MovieListManager.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

class MovieListManager: ObservableObject {
    
    @Published var idbResponse = IDBResponse(items: [Item](), errorMessage: "")

//    @Published var idbResponse = IDBResponse(items: [Item(id: "tt0111161", rank: "1", title: "aadada", fullTitle: "adawdawd", year: "1212", image: "https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX128_CR0,3,128,176_AL_.jpg", crew: "aaaa", imDbRating: "12", imDbRatingCount: "aa")], errorMessage: "")

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
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            idbResponse.items.remove(at: index)
        }
    }
    
    func move(indeces: IndexSet, newOffset: Int) {
        idbResponse.items.move(fromOffsets: indeces, toOffset: newOffset)
    }
}

