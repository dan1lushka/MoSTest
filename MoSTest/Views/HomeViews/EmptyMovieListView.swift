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
            if movieListManager.imdbResponse.errorMessage == "" && movieListManager.imdbResponse.items.count == 0 {
                    Spacer()
                    Text("No Data")
                        .font(.title)
                    Spacer()
                HStack {
                    Button(action: {
                            movieListManager.loadMovies()
                        }) {
                            Text("Fetch Data")
                                .font(.title)
                                .clipShape(Rectangle())
                                .frame(width: 300, height: 50, alignment: .center)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                    }
                }
            }
        }
    }
}

struct EmptyMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMovieListView(movieListManager: MovieListManager())
    }
}
