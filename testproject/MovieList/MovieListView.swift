//
//  MovieListView.swift
//  testproject
//
//  Created by abraham nefi on 21/11/24.
//
import UIKit
import Foundation

class MovieListView: UIViewController {
    private let presenter: MovieListPresenter
    
    init(presenter: MovieListPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        self.title = "Top Rated Movies"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupTable()
        view.backgroundColor = .gray
        presenter.onViewAppear()
    }
    
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor.lightGray
        tableView.clipsToBounds = true
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "moviecell")
        tableView.estimatedRowHeight = 210
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private func setupTable() {
        view.addSubview(moviesTableView)
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
        ])
    }
}

// MARK: - TableView delegates & datasource
extension MovieListView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.listOfMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moviecell", for: indexPath) as! MovieCellView
        let movie = presenter.listOfMovies[indexPath.row]
        cell.setupMovieInfo(movie: movie)
        return cell
    }
}

extension MovieListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.onCellSelected(atIndex: indexPath.row)
    }
}

// MARK: - ListMoviesProtocol implementation
extension MovieListView: ListMoviesUIProtocol {
    func refresh(movies: [MovieBasicModel]) {
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}
