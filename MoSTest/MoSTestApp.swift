//
//  MoSTestApp.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

@main
struct MoSTestApp: App {
    
    @StateObject var movieListManager = MovieListManager()
    
    var body: some Scene {
        WindowGroup {
            HomeView(movieListManager: movieListManager)
        }
    }
}
