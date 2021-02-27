//
//  ContentView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    @Environment(\.editMode) var editMode
    
    var body: some View {
        NavigationView {
            VStack {
                if movieListManager.idbResponse.items.count > 0 {
                    List {
                        ForEach(movieListManager.idbResponse.items) { movie in
                            ZStack {
                                Color.gray
                                MovieListCellView(item: movie)
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
                    Text("No Data")
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
