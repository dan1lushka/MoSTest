//
//  ErrorView.swift
//  MoSTest
//
//  Created by Daniel Rybak on 06/03/2021.
//

import SwiftUI

struct ErrorView: View {
    
    @ObservedObject var movieListManager: MovieListManager
    
    var body: some View {
        VStack {
            if movieListManager.imdbResponse.errorMessage != "" && movieListManager.imdbResponse.items.count == 0 {
                Text("Error!")
                    .font(.title)
                Text(movieListManager.imdbResponse.errorMessage)
                    .font(.title)
            }
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(movieListManager: MovieListManager().exampleWithError)
    }
}
