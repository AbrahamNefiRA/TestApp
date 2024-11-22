//
//  TopRatedMoviesResponseEntity.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//
import Foundation

struct TopRatedMoviesResponseEntity: Decodable {
    let results: [TopRatedMoviesEntity]
}
