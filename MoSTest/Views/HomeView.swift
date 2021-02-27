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
                ForEach(movieListManager.items) { movie in
                    NavigationLink(
                        destination: Text("To be added"),
                        label: {
                            Text("To Be added")
                        })
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
