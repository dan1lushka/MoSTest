//
//  MovieListCellView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct MovieListCellView: View {
    var fullTitle: String
    var imageURL: String
    var rating: String
    
    var body: some View {
            HStack {
                UrlImageView(urlString: imageURL)
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                VStack {
                    Text(fullTitle)
                    Text("Rating: \(rating)")
                }
            }
    }
}

struct MovieListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCellView(fullTitle: "aaaaa", imageURL: "", rating: "1")
    }
}
