//
//  MovieListView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 03/03/2021.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    @Binding private var isPresented: Bool
    
    var body: some View {
        if movieListManager.idbResponse.items.count > 0 {
            List {
                ForEach(movieListManager.idbResponse.items) { movie in
                    ZStack {
                        Color.gray
                        MovieListRowView(item: movie)
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
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    
    @State var isPresentedExample = true
    
    static var previews: some View {
        MovieListView(movieListManager: MovieListManager.init(), isPresented: isPresentedExample)
    }
}
