//
//  MovieListInteractor.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation

class MovieListInteractor {
    /**tried to add alamofire with spm but found problems**/
    func getMovieList() async -> TopRatedMoviesResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated?api_key=32c1f1d0b1dc77f0280548e979584162")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(TopRatedMoviesResponseEntity.self, from: data)
    }
}
