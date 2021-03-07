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
        
        if isViewUp {
            GeometryReader { geometry in
                VStack(alignment: .leading, spacing: 10) {
                    UrlImageView(urlString: movieItem.image)
                        .frame(width: geometry.size.width, height: geometry.size.height / 3)
                        .scaledToFill()
                    VStack(alignment: .leading, spacing: 10) {
                        Text(movieItem.fullTitle)
                            .font(.title)
                        Text("Rating: \(movieItem.imDbRating)")
                            .font(.headline)
                        Text(movieItem.crew)
                            .font(.body)
                    }
                    .padding()
                }
            }
        } else {
            GeometryReader { geometry in
                VStack(alignment: .leading) {
                    Spacer()
                    Text(movieItem.crew)
                        .font(.body)
                    Text("Rating: \(movieItem.imDbRating)")
                        .font(.headline)
                    Text(movieItem.fullTitle)
                        .font(.title)
                    UrlImageView(urlString: movieItem.image)
                        .frame(width: geometry.size.width, height: geometry.size.height / 3)
                        .scaledToFill()
                }
            }
        }
    }
}

struct detailViewCombiner {
    var arr: [Any]
}

struct DetailViewBody_Previews: PreviewProvider {
    static var previews: some View {
        DetailViewBody(isViewUp: .constant(true), movieItem: MovieListManager().exampleWithData.imdbResponse.items.first!)
    }
}
