//
//  ContentView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    @State private var isPresented = false
    
    var body: some View {
        NavigationView {
            VStack {
                if movieListManager.idbResponse.items.count > 0 {
                    List {
                        ForEach(movieListManager.idbResponse.items) { movie in
                            ZStack {
                                Color.gray
                                MovieListCellView(item: movie)
                                NavigationLink(destination: DetailView(movieItem: movie), isActive: $isPresented) {
                                    
                                }
                            }
                        }
                        .onDelete(perform: { indexSet in
                            movieListManager.delete(at: indexSet)
                        })
                        .onMove { (indeces, newOffset) in
                            movieListManager.idbResponse.items.move(fromOffsets: indeces, toOffset: newOffset)
                        }
                    }
                } else {
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
            .navigationBarTitle(Text("Top Movies"), displayMode: .inline)
            .navigationBarItems(trailing: EditButton())
        }
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(movieListManager: MovieListManager())
    }
}
