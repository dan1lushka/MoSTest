//
//  Movies.swift
//  MoSTest
//
//  Created by Daniel Rybak on 27/02/2021.
//

import Foundation
import SwiftUI

struct IMDBResponse: Codable {
    var items: [Item]
    var errorMessage: String
}

struct Item: Identifiable, Codable {
    var id: String
    var rank: String
    var title: String
    var fullTitle: String
    var year: String
    var image: String
    var crew: String
    var imDbRating: String
    var imDbRatingCount: String
}
