//
//  MoviesMapper.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation

struct MoviesMapper {
    func map(entity: TopRatedMoviesEntity) -> MovieBasicModel {
        MovieBasicModel(id: "\(entity.id)",
                        title: entity.title,
                        overview: entity.overview,
                        imageURL: "https://image.tmdb.org/t/p/w200\(entity.imageURL)",
                        rating: "\(entity.votes)")
    }
}
