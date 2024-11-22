//
//  MovieDetailRouter.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation
import UIKit

protocol DetailMovieRouting: AnyObject {
    func showDetailView(withId movieId: String, fromViewController: UIViewController)
}

class MovieDetailRouter: DetailMovieRouting {
    func showDetailView(withId movieId: String, fromViewController: UIViewController) {
        let interactor = MovieDetailInteractor()
        let presenter = MovieDetailPresenter(movieId: movieId,
                                             interactor: interactor,
                                             mapper: MapperDetailMovie())
        let view = MovieDetailView(presenter: presenter)
        presenter.detailMovieUI = view
        
        fromViewController.present(view, animated: true)
    }
}
