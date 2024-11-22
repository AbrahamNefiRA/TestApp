//
//  MapperDetailMovie.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation

/**mappers create specific custom models to filter only necessary info to different levels-views **/
struct MapperDetailMovie {
    func map(entity: MovieDetailEntity) -> DetailMovieModel {
        .init(title: entity.title,
              overview: entity.overview,
              backdropPath: "https://image.tmdb.org/t/p/w200\(entity.backDropPath)")
    }
}
