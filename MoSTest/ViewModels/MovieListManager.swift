//
//  MovieListManager.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

class MovieListManager: ObservableObject {
    
    enum MovieListManagerState {
        case empty
        case withError
        case withData
    }
    
    @Published var state: MovieListManagerState = .empty
    @Published var imdbResponse = IMDBResponse(items: [Item](), errorMessage: "")
    
    var url = "https://imdb-api.com/en/API/Top250Movies/k_x3hy019r"
    
    static var exampleWithData: MovieListManager {
        let example = MovieListManager()
        example.imdbResponse = IMDBResponse(items: [Item(id: "tt0111161",
                                                         rank: "1",
                                                         title: "title",
                                                         fullTitle: "full title",
                                                         year: "2021",
                                                         image: "https://m.media-amazon.com/images/M/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,1,128,176_AL_.jpg",
                                                         crew: "crew members",
                                                         imDbRating: "12",
                                                         imDbRatingCount: "0"),
                                                    Item(id: "tt0111161",
                                                         rank: "1",
                                                         title: "title1",
                                                         fullTitle: "full title1",
                                                         year: "2021",
                                                         image: "https://m.media-amazon.com/images/M/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM@._V1_UX128_CR0,3,128,176_AL_.jpg",
                                                         crew: "crew members1",
                                                         imDbRating: "12",
                                                         imDbRatingCount: "0")],
                                            errorMessage: "")
        example.state = .withData
        return example
    }
    
    static var exampleWithError: MovieListManager {
        let example = MovieListManager()
        example.imdbResponse = IMDBResponse(items: [Item](), errorMessage: "some error")
        example.state = .withError
        return example
    }
    
    static var emptyExample: MovieListManager {
        let example = MovieListManager()
        example.imdbResponse = IMDBResponse(items: [Item](), errorMessage: "")
        example.state = .empty
        return example
    }
    
    init() {
        loadMovies()
    }
    
    func loadMovies() {
        guard let url = URL(string: self.url) else {
            self.imdbResponse.errorMessage = "Invalid API URL"
            self.state = .withError
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(IMDBResponse.self, from: data) {
                    DispatchQueue.main.async {
                        self.imdbResponse = decodedResponse
                        self.state = .withData
                    }
                    return
                }
            }
            self.imdbResponse.errorMessage = error?.localizedDescription ?? "Unknown error"
            self.state = .withError
        }.resume()
    }
    
    func delete(at indexSet: IndexSet) {
        for index in indexSet {
            imdbResponse.items.remove(at: index)
            
            if imdbResponse.items.count == 0 {
                self.state = .empty
            }
        }
    }
    
    func move(indeces: IndexSet, newOffset: Int) {
        imdbResponse.items.move(fromOffsets: indeces, toOffset: newOffset)
    }
}

