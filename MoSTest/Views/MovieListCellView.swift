//
//  MovieListCellView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct MovieListCellView: View {
    var fullTitle: String
    var image: String
    var rating: String
    
    var body: some View {
            HStack {
                Image(systemName: image)
                VStack {
                    Text(fullTitle)
                    Text("Rating: \(rating)")
                }
            }
    }
}

struct MovieListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCellView(fullTitle: "aaaaa", image: "trash", rating: "1")
    }
}

