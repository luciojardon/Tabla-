//
//  ViewController.swift
//  tabla
//
//  Created by Lucio Jardon on 8/29/19.
//  Copyright © 2019 Lucio Jardon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        
        tableView.delegate = self
        tableView.dataSource = self
        
        super.viewDidLoad()
      getMovies()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        
        let index =  indexPath.row
        let contacto = movies[index]
        cell.telefono.text =  contacto.Sumary
        cell.nombre.text = contacto.name
        
        return cell

    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    private func getMovies() {
        
        let url: String = "https://api.themoviedb.org/4/list/1?api_key=6de141add9b48d75416a80e7d8e74967"
        
        let task = URLSession.shared.dataTask(
        
           with: URL (string: url)!,
           completionHandler: {
            (data, reponse , error)  in
            if let data = data {
                let json = try! JSONSerialization.jsonObject(with: data, options: .allowFragments) as! [String: Any]
                
                if let results  = json["results"] as? [[String: Any]] {
                    
                    for p in results {
                        
                       let title =  (p["title"] )   as? String ?? ""
                       let overvew =   (p["overview"] )  as? String ?? ""
                        let pelicula = Movie( name: title , Sumary: overvew   )
                       self.movies.append(pelicula)
                        
                        
                    }
                    
                   self.tableView.reloadData()
                    
                }
                
                
                
                
            }
        }
        
        )
    task.resume()
    }
}

