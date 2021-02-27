//
//  DetailView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct DetailView: View {
    
    var movieItem: Item
    
    var body: some View {
        Text("Hello, World!")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movieItem: Item(id: "1", rank: "1", title: "1", fullTitle: "1", year: "1", image: "1", crew: "1", imDbRating: "1", imDbRatingCount: "1"))
    }
}
