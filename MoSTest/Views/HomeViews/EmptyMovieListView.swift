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
                .font(.title)
            Spacer()
            HStack {
                Button(action: {
                    movieListManager.loadMovies(url: movieListManager.url)
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

struct EmptyMovieListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyMovieListView(movieListManager: MovieListManager(url: ""))
    }
}
