//
//  DetailViewBody.swift
//  MoSTest
//
//  Created by Daniel Rybak on 04/03/2021.
//

import SwiftUI

struct DetailViewBody: View {
    
    @Binding var isViewUp: Bool
    var movieItem: Item
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                UrlImageView(urlString: movieItem.image)
                    .frame(width: geometry.size.width, height: geometry.size.height / 3)
                    .scaledToFill()
                Text(movieItem.fullTitle)
                Text("Rating: \(movieItem.imDbRating)")
                Text(movieItem.crew)
                Spacer()
            }
        }
    }
}

struct DetailViewBody_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewBody(isViewUp: .constant(true), movieItem: MovieListManager().example.imdbResponse.items.first!)
    }
}
