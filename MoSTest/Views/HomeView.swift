//
//  ContentView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct HomeView: View {
    
    @State private var movies = [Movie(id: "1", rank: 1, title: "", fullTitle: "", year: 1, image: "", crew: "", imDbRating: 1.0, imDbRatingCount: 1)]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(movies) { movie in
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
        HomeView()
    }
}
