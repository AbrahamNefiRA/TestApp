//
//  MovieDetailPresenter.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation

/** Protocols to connect with view**/
protocol MovieDetailPresenterProtocol: AnyObject {
    func updateMovieDetailUI(movieModel: DetailMovieModel)
}

protocol DetailPresentable: AnyObject {
    var detailMovieUI: MovieDetailPresenterProtocol? { get }
    var movieId: String { get }
    func onViewAppear()
}

class MovieDetailPresenter: DetailPresentable {
    private let interactor: MovieDetailInteractorProtocol
    private let mapper: MapperDetailMovie
    weak var detailMovieUI: MovieDetailPresenterProtocol?
    let movieId: String
    
    init(movieId: String, interactor: MovieDetailInteractorProtocol, mapper: MapperDetailMovie) {
        self.interactor = interactor
        self.movieId = movieId
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let detailEntity = await interactor.getMovieDetails(withId: movieId)
            let movieModel = mapper.map(entity: detailEntity)
            DispatchQueue.main.async {
                self.detailMovieUI?.updateMovieDetailUI(movieModel: movieModel)
            }
        }
    }
}
