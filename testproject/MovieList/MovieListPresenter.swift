//
//  MovieListPresenter.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation

protocol MoviewListPresentable: AnyObject {
    var listMoviesUI: ListMoviesUIProtocol? { get }
    var listOfMovies: [MovieBasicModel] { get }
    
    func onViewAppear()
    func onCellSelected(atIndex: Int)
}

protocol ListMoviesUIProtocol: AnyObject {
    func refresh(movies: [MovieBasicModel])
}

class MovieListPresenter: MoviewListPresentable {
    private let movieListInteractor: MovieListInteractor
    private let mapper: MoviesMapper
    weak var listMoviesUI: ListMoviesUIProtocol?
    var listOfMovies: [MovieBasicModel] = []
    private let router: MovieListRouting
    
    init(movieListInteractor: MovieListInteractor, mapper: MoviesMapper = MoviesMapper(), router: MovieListRouting) {
        self.movieListInteractor = movieListInteractor
        self.mapper = mapper
        self.router = router
    }
    
    func onViewAppear() {
        Task {
            let movieModels = await movieListInteractor.getMovieList().results
            listOfMovies = movieModels.map(mapper.map(entity:))
            listMoviesUI?.refresh(movies: listOfMovies)
        }
    }
    
    func onCellSelected(atIndex: Int) {
        let movieId = listOfMovies[atIndex].id
        router.showDetailMovie(withId: movieId)
    }
}
