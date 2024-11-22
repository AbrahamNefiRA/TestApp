//
//  MovieCell.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//
import UIKit
import Kingfisher
import Foundation

class MovieCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(movieName)
        addSubview(movieDescription)
        addSubview(moviePoster)
        addSubview(movieRatingLabel)
        
        NSLayoutConstraint.activate([
            moviePoster.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            moviePoster.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            moviePoster.heightAnchor.constraint(equalToConstant: 180),
            moviePoster.widthAnchor.constraint(equalToConstant: 100),
            moviePoster.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            movieName.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12),
            movieName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieName.topAnchor.constraint(equalTo: moviePoster.topAnchor, constant: 24),
            
            movieDescription.leadingAnchor.constraint(equalTo: moviePoster.trailingAnchor, constant: 12),
            movieDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            movieDescription.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 8),
            movieDescription.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor, constant: -12),
            
            movieRatingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            movieRatingLabel.topAnchor.constraint(equalTo: moviePoster.bottomAnchor),
            movieRatingLabel.heightAnchor.constraint(equalToConstant: 25),
            movieRatingLabel.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor),
            movieRatingLabel.trailingAnchor.constraint(equalTo: moviePoster.trailingAnchor),
        ])
    }
    
    func setupMovieInfo(movie: MovieBasicModel) {
        movieName.text = movie.title
        movieDescription.text = movie.overview
        moviePoster.kf.setImage(with: URL(string: movie.imageURL))
        movieRatingLabel.text = movie.rating
    }
    
    let movieName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18,
                                 weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let movieDescription: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,
                                 weight: .regular,
                                 width: .condensed)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let moviePoster: UIImageView = {
        let movieView = UIImageView()
        movieView.contentMode = .scaleAspectFit
        movieView.translatesAutoresizingMaskIntoConstraints = false
        return movieView
    }()
    
    let movieRatingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16,
                                 weight: .bold)
        label.textColor = .blue
        label.textAlignment = .center
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
