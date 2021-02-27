//
//  DetailView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct DetailView: View {
    var movieItem: Item
    
    @State private var isViewUp = true

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                if isViewUp {
                    UrlImageView(urlString: movieItem.image)
                        .frame(width: geometry.size.width, height: geometry.size.height / 3)
                        .scaledToFill()
                    Spacer()
                    Text(movieItem.fullTitle)
                    Text("Rating: \(movieItem.imDbRating)")
                    Text(movieItem.crew)
                    Spacer(minLength: geometry.size.height / 2)
                } else {
                    Spacer()
                    Text(movieItem.crew)
                    Text("Rating: \(movieItem.imDbRating)")
                    Text(movieItem.fullTitle)
                    UrlImageView(urlString: movieItem.image)
                        .frame(width: geometry.size.width, height: geometry.size.height / 3)
                        .scaledToFill()
                }
            }
        }
        .navigationTitle(Text("\(movieItem.title)"))
        .navigationBarItems(trailing: Button(action: {
            isViewUp.toggle()
        }, label: {
            Image("Icon-ArrowsUpDown")
        }))
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movieItem: Item(id: "1", rank: "1", title: "1", fullTitle: "1", year: "1", image: "1", crew: "1", imDbRating: "1", imDbRatingCount: "1"))
    }
}
