//
//  MovieDetailView.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//

import Foundation
import UIKit
import Kingfisher

class MovieDetailView: UIViewController {
    private let presenter: DetailPresentable
    
    init(presenter: DetailPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupViews()
        presenter.onViewAppear()
    }
    
    private func setupViews() {
        view.addSubview(moviePhotoView)
        view.addSubview(movieTitle)
        view.addSubview(movieDescription)
        
        NSLayoutConstraint.activate([
            moviePhotoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 12),
            moviePhotoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviePhotoView.heightAnchor.constraint(equalToConstant: 200),
            moviePhotoView.widthAnchor.constraint(equalToConstant: 300),
        
            movieTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            movieTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            movieTitle.topAnchor.constraint(equalTo: moviePhotoView.bottomAnchor, constant: 22),
            
            movieDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 22),
            movieDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -22),
            movieDescription.topAnchor.constraint(equalTo: movieTitle.bottomAnchor, constant: 20),
        ])
    }
    
    let moviePhotoView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 26, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
}

extension MovieDetailView: MovieDetailPresenterProtocol {
    func updateMovieDetailUI(movieModel: DetailMovieModel) {
        moviePhotoView.kf.setImage(with: URL(string: movieModel.backdropPath))
        movieTitle.text = movieModel.title
        movieDescription.text = movieModel.overview
    }
}
