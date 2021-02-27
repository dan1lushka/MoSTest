//
//  ContentView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movieListManager.idbResponse.items) { movie in
                    ZStack {
                        Color.gray
                        MovieListCellView(fullTitle: movie.fullTitle, imageURL: movie.image, rating: movie.imDbRating, crew: movie.crew)
                    }
                }
                if movieListManager.idbResponse.items.count == 0 {
                    Text("No Data")
                }
            }
            .navigationBarTitle(Text("Top Movies"), displayMode: .inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(movieListManager: MovieListManager())
    }
}
