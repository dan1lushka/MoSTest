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
    var crew: String
    
    @State private var showCrewDetails = false
    
    var body: some View {
        
        VStack {
            HStack(alignment: .center, spacing: 10) {
                UrlImageView(urlString: imageURL)
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                
                VStack {
                    Text(fullTitle)
                    Text("Rating: \(rating)")
                }
                
                Button(action: {
                    showCrewDetails.toggle()
                }, label: {
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
                })
            }
            if showCrewDetails {
                Text(crew)
            }
        }
        
    }
}

struct MovieListCellView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListCellView(fullTitle: "aaaaa", imageURL: "", rating: "1", crew: "")
    }
}
