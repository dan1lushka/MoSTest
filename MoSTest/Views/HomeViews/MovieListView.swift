//
//  MovieListView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 03/03/2021.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    @Binding var isDetailViewPresented: Bool
    @Environment(\.editMode) private var editMode
    @State private var showCrewDetailsButton = true
    @State private var showBurgerMenuButton = false
    
    var body: some View {
        if movieListManager.imdbResponse.items.count > 0 {
            List {
                ForEach(movieListManager.imdbResponse.items) { movie in
                        NavigationLink(destination: DetailView(movieItem: movie), isActive: $isDetailViewPresented) {
                            MovieListRowView(item: movie, showCrewDetailsButton: $showCrewDetailsButton)
                        }
                }
                .onDelete(perform: { indexSet in
                    movieListManager.delete(at: indexSet)
                })
                .onMove { (indeces, newOffset) in
                    movieListManager.imdbResponse.items.move(fromOffsets: indeces, toOffset: newOffset)
                }
                .onChange(of: editMode!.wrappedValue, perform: { value in
                    if value.isEditing {
                        showCrewDetailsButton = false
                        showBurgerMenuButton = true
                    } else {
                        showCrewDetailsButton = true
                        showBurgerMenuButton = false
                    }
                })
                .listRowBackground(Color.gray
                                    .clipped()
                                    .cornerRadius(10)
                                    .padding(5))
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListManager: MovieListManager().exampleWithData, isDetailViewPresented: .constant(true))
    }
}
