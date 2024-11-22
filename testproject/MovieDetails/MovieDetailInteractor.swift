//
//  MovieDetailInteractor.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation
/**protocols to connect with presenter**/
protocol MovieDetailInteractorProtocol: AnyObject {
    func getMovieDetails(withId id: String) async -> MovieDetailEntity
}

class MovieDetailInteractor: MovieDetailInteractorProtocol {
    /**tried to add alamofire with spm but found problems**/
    func getMovieDetails(withId id: String) async -> MovieDetailEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/\(id)?api_key=32c1f1d0b1dc77f0280548e979584162")!
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(MovieDetailEntity.self, from: data)
    }
}
