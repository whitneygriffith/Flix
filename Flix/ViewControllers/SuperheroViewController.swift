//
//  SuperheroViewController.swift
//  Flix
//
//  Created by Whitney Griffith on 9/9/18.
//  Copyright © 2018 Whitney Griffith. All rights reserved.
//

import UIKit

class SuperheroViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie] = []
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PosterCell", for: indexPath ) as! PosterCell
        let movie = movies[indexPath.item]
        cell.posterImageView.af_setImage(withURL: movie.posterUrl!)
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.dataSource = self
        fetchMovies()
    }
    
    func fetchMovies(){
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        
        let task = session.dataTask(with: request) { (data, response, error) in
            //This will run when the asynchronous network request returns.
            if let error = error {
                print(error.localizedDescription)
            }else if let data = data {
                let dataDictionary = try!  JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                let movies = dataDictionary["results"] as! [[String: Any]]
                self.movies = Movie.movies(dictionaries: movies)
                self.collectionView.reloadData()
                //self.refreshControl.endRefreshing()
                
            }
        }
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! UICollectionViewCell
        if let indexPath = collectionView.indexPath(for: cell){
            let movie = movies[indexPath.row]
            let detailViewController = segue.destination as! DetailViewController
            detailViewController.movie = movie
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
    
