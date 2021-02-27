//
//  MovieListManager.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import Foundation

class MovieListManager: ObservableObject {
    @Published var items: [Movie] = [Movie(id: "1", rank: 1, title: "", fullTitle: "", year: 1, image: "", crew: "", imDbRating: 1.0, imDbRatingCount: 1)]
    
    init() {
        
    }
}
