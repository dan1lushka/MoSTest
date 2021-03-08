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
            Text("Error!")
                .font(.title)
            Text(movieListManager.errorMessage)
                .font(.title)
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(movieListManager: MovieListManager.exampleWithError)
    }
}
