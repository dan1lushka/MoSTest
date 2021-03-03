//
//  EmptyMovieListView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 03/03/2021.
//

import SwiftUI

struct EmptyMovieListView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    
    var body: some View {
        VStack {
            Spacer()
            Text("No Data")
            Spacer()
            Button(action: {
                movieListManager.loadMovies()
            }) {
                Text("Fetch Data")
            }
        }
    }
}

struct EmptyMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMovieListView(movieListManager: MovieListManager())
    }
}
