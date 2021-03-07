//
//  DetailViewBody.swift
//  MoSTest
//
//  Created by Daniel Rybak on 04/03/2021.
//

import SwiftUI

struct TopDetailBodyView: View {
    
    @Binding var isViewUp: Bool
    var movieItem: Item
    
    var body: some View {
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
    }
}

struct BottomDetailBodyView: View {
    
    @Binding var isViewUp: Bool
    var movieItem: Item
    
    var body: some View {
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

struct DetailViewBody: View {
    
    @Binding var isViewUp: Bool
    var movieItem: Item
    
    var body: some View {
        if isViewUp {
            TopDetailBodyView(isViewUp: $isViewUp, movieItem: movieItem)
        } else {
            BottomDetailBodyView(isViewUp: $isViewUp, movieItem: movieItem)
        }
    }
}

struct detailViewCombiner {
    var arr: [Any]
}

struct DetailViewBody_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailViewBody(isViewUp: .constant(true), movieItem: MovieListManager.exampleWithData.imdbResponse.items.first!)
            DetailViewBody(isViewUp: .constant(false), movieItem: MovieListManager.exampleWithData.imdbResponse.items.first!)
        }
    }
}
