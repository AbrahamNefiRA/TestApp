//
//  TopRatedMoviesEntity.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//
import Foundation

struct TopRatedMoviesEntity: Decodable {
    var id: Int
    var title: String
    var overview: String
    var imageURL: String
    var votes: Double
    
    enum CodingKeys: String, CodingKey {
        case id, overview, title
        case imageURL = "poster_path"
        case votes = "vote_average"
    }
}
