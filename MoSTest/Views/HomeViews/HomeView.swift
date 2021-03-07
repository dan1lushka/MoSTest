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
                switch movieListManager.state {
                case .empty:
                    EmptyMovieListView(movieListManager: movieListManager)
                case .withData:
                    MovieListView(movieListManager: movieListManager, isDetailViewPresented: $isDetailViewPresented)
                case .withError:
                    ErrorView(movieListManager: movieListManager)
                }
            }
            .navigationBarTitle(Text("Top Movies"), displayMode: .inline)
            .navigationBarItems(leading: EditButton())
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let emptyManager = MovieListManager()
        let nonEmptyManager = MovieListManager.exampleWithData
        let errorManager = MovieListManager.exampleWithError
        
        Group {
            HomeView(movieListManager: emptyManager)
            HomeView(movieListManager: nonEmptyManager)
            HomeView(movieListManager: errorManager)
        }
    }
}
