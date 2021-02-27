//
//  Movies.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import Foundation
import SwiftUI

struct Movie: Identifiable {
    var id: String
    var rank: Int
    var title: String
    var fullTitle: String
    var year: Int
    var image: String
    var crew: String
    var imDbRating: Double
    var imDbRatingCount: Int
}
