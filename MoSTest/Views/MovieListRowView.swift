//
//  MovieListCellView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import SwiftUI

struct DetailsImage: View {
    
    @Binding var showDetails: Bool
    
    var body: some View {
        Image("Icon-ChevronThinDown")
            .frame(width: 20, height: 20, alignment: .center)
            .clipShape(Circle())
            .padding(2)
            .overlay(Circle().stroke(Color.black, lineWidth: 1))
            .rotationEffect(.degrees(showDetails ? 180 : 0))
    }
}

struct MovieListRowView: View {
    var item: Item
    
    @State private var showCrewDetails = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center) {
                UrlImageView(urlString: item.image)
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .cornerRadius(15)
                    .padding()

                VStack(alignment: .leading, spacing: 20) {
                    Text(item.title)
                        .font(.headline)
                    Text("Rating: \(item.imDbRating)")
                }
                
                Spacer()

                Button {} label: {
                    DetailsImage(showDetails: $showCrewDetails)
                }
                .onTapGesture {
                    showCrewDetails.toggle()
                }
                .padding()
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



