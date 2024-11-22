//
//  MovieListRouter.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import UIKit
import Foundation

protocol MovieListRouting: AnyObject {
    var detailRouter: DetailMovieRouting? { get }
    var listOfMoviesView: MovieListView? { get }
    
    func showMovies(window: UIWindow?)
    func showDetailMovie(withId movieId: String)
}

class MovieListRouter: MovieListRouting {
    var detailRouter: DetailMovieRouting?
    var listOfMoviesView: MovieListView?
    
    func showMovies(window: UIWindow?) {
        let interactor = MovieListInteractor()
        let presenter = MovieListPresenter(movieListInteractor: interactor,
                                           router: self)
        listOfMoviesView = MovieListView(presenter: presenter)
        presenter.listMoviesUI = listOfMoviesView
        detailRouter = MovieDetailRouter()
    
        let navigationController = UINavigationController()
        navigationController.viewControllers.append(listOfMoviesView! as UIViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    func showDetailMovie(withId movieId: String) {
        guard let moviesVC = listOfMoviesView else { return }
        detailRouter?.showDetailView(withId: movieId,
                                     fromViewController: moviesVC)
    }
}
