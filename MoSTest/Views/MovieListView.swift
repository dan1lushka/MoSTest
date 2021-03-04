//
//  MovieListView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 03/03/2021.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    @Binding var isPresented: Bool
    
    var body: some View {
        if movieListManager.imdbResponse.items.count > 0 {
            List {
                ForEach(movieListManager.imdbResponse.items) { movie in
                    ZStack {
                        MovieListRowView(item: movie)
                        NavigationLink(destination: DetailView(movieItem: movie), isActive: $isPresented) {
                        }
                    }
                }
                .onDelete(perform: { indexSet in
                    movieListManager.delete(at: indexSet)
                })
                .onMove { (indeces, newOffset) in
                    movieListManager.imdbResponse.items.move(fromOffsets: indeces, toOffset: newOffset)
                }
                .background(Color.gray)
                .cornerRadius(15)
            }
            
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListManager: MovieListManager().example, isPresented: .constant(true))
    }
}
