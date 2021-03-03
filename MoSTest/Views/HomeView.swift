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
    
//    var movieListView: some View {
//
//    }
    
    var emptyListView: some View {
        VStack {
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
    
    var body: some View {
        NavigationView {
            VStack {
            
                } else {
                    emptyListView
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
