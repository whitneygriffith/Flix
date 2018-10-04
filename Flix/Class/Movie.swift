//
//  Movie.swift
//  Flix
//
//  Created by Whitney Griffith on 10/4/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import Foundation

class Movie {
    
    var title: String
    var posterUrl: URL?
    var overview: String
    var releaseDate: String
    var backdropURL: URL?
    init(dictionary: [String: Any]) {
        title = dictionary["title"] as? String ?? "No title"
        
        let posterPath = dictionary["poster_path"] as? String
        if let posterPath = posterPath {
            let baseUrlString = "https://image.tmdb.org/t/p/w500"
            let fullPosterPath = baseUrlString + posterPath
            posterUrl = URL(string: fullPosterPath)
        }
        overview = dictionary["overview"] as? String ?? "No overview"
        releaseDate = dictionary["release_date"] as? String ?? "No release data"
        
        let backdropPath = dictionary["backdrop_path"] as? String
        if let backdropPath = backdropPath {
            let baseUrlString = "https://image.tmdb.org/t/p/w500"
            let fullBackdropPath = baseUrlString + backdropPath
            backdropURL = URL(string: fullBackdropPath)
        }
    }

     
    class func movies(dictionaries: [[String: Any]]) -> [Movie] {
        var movies: [Movie] = []
        for dictionary in dictionaries {
            let movie = Movie(dictionary: dictionary)
            movies.append(movie)
        }
        
        return movies
    }
}


