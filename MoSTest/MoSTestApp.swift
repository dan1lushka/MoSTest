//
//  MoSTestApp.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

@main
struct MoSTestApp: App {

    @StateObject var movieListManager = MovieListManager(url: "https://imdb-api.com/en/API/Top250Movies/k_x3hy019r")
    
    var body: some Scene {
        WindowGroup {
            HomeView(movieListManager: movieListManager)
        }
    }
}
