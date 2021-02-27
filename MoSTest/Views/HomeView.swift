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
            VStack {
                if movieListManager.idbResponse.items.count > 0 {
                    List {
                        ForEach(movieListManager.idbResponse.items) { movie in
                            ZStack {
                                Color.gray
                                MovieListCellView(fullTitle: movie.fullTitle, imageURL: movie.image, rating: movie.imDbRating, crew: movie.crew)
                            }
                        }
                        .onDelete(perform: { indexSet in
                            movieListManager.delete(at: indexSet)
                        })
                    }
                } else {
                    Text("No Data")
                }
            }
            .navigationBarTitle(Text("Top Movies"), displayMode: .inline)
                .toolbar(content: {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                })
        }
       
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(movieListManager: MovieListManager())
    }
}
