//
//  MovieListCellView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct MovieListRowView: View {
    var item: Item
    
    @State private var showCrewDetails = false
    
    var body: some View {
        VStack {
            HStack {
                UrlImageView(urlString: item.image)
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                VStack {
                    Text(item.title)
                    Text("Rating: \(item.imDbRating)")
                }
                
                Button {} label: {
                    if !showCrewDetails {
                        Image("Icon-ChevronThinDown")
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                    } else {
                        Image("Icon-ChevronThinDown")
                            .clipShape(Circle())
                            .padding(2)
                            .overlay(Circle().stroke(Color.black, lineWidth: 1))
                            .rotationEffect(.degrees(180))
                    }
                }
                .onTapGesture {
                    showCrewDetails.toggle()
                }
            }
            
            if showCrewDetails {
                Text(item.crew)
            }
        }
    }
}

struct MovieListRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListRowView(item: MovieListManager().example.imdbResponse.items.first!)
    }
}

