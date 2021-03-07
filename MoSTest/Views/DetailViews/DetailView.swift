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
       
        DetailViewBody(isViewUp: $isViewUp, movieItem: movieItem)
        
        .navigationTitle(Text("\(movieItem.title)"))
            .navigationBarItems(trailing: Button(action: {
                withAnimation(.linear(duration: 1)) {
                    isViewUp.toggle()
                }
            }, label: {
                Image("Icon-ArrowsUpDown")
            }))
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(movieItem: MovieListManager.exampleWithData.imdbResponse.items.first!)
    }
}

