//
//  MovieDetailEntity.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation

struct MovieDetailEntity: Decodable {
    let title: String
    let overview: String
    let releaseDate: String
    let votes: Double
    let backDropPath: String
    
    enum CodingKeys: String, CodingKey {
        case overview, title
        case backDropPath = "backdrop_path"
        case votes = "vote_average"
        case releaseDate = "release_date"
    }
}
