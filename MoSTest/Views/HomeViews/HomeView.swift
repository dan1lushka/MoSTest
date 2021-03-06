//
//  ContentView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    @State private var isDetailViewPresented = false

    var body: some View {
        NavigationView {
            VStack {
                //Home View will show the MovieListView as long as there are items in movieListManager.imdbResponse.items
                //if there are no elements EmptyMovieListView will be shown
                
                MovieListView(movieListManager: movieListManager, isDetailViewPresented: $isDetailViewPresented)
                EmptyMovieListView(movieListManager: movieListManager)
                ErrorView(movieListManager: movieListManager)
            }
            .navigationBarTitle(Text("Top Movies"), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let emptyManager = MovieListManager()
        let nonEmptyManager = MovieListManager().exampleWithData
        let errorManager = MovieListManager().exampleWithError
        
        Group {
            HomeView(movieListManager: emptyManager)
            HomeView(movieListManager: nonEmptyManager)
            HomeView(movieListManager: errorManager)
        }
    }
}
