//
//  ViewController.swift
//  SearchBar
//
//  Created by dmorenoar on 27/12/18.
//  Copyright © 2018 dmorenoar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate{
    

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filterMovies:[Movie] = [Movie]()
    var isSearching:Bool = false

    var listMovies:[Movie] = [
        Movie(title: "Rompe Ralph", img: UIImage(named: "rompeRalph")!),
        Movie(title: "Intocable", img: UIImage(named: "intocable")!),
        Movie(title: "Campeones", img: UIImage(named: "campeones")!),
        Movie(title: "Shrek", img: UIImage(named: "shrek")!),
        Movie(title: "Scary Movie", img: UIImage(named: "scaryMovie")!),
        Movie(title: "Zoolander", img: UIImage(named: "zoolander")!),
        Movie(title: "Creed", img: UIImage(named: "creed")!),
        Movie(title: "Bohemian Rhapsody", img: UIImage(named: "bohemianRhapsody")!),
        Movie(title: "Ha nacido una estrella", img: UIImage(named: "nacidoEstrella")!),
        Movie(title: "Lo imposible", img: UIImage(named: "loImposible")!),
        Movie(title: "Titanic", img: UIImage(named: "titanic")!),
        Movie(title: "Intersterllar", img: UIImage(named: "interstellar")!),
        Movie(title: "Blade Runner", img: UIImage(named: "bladeRunner")!),
        Movie(title: "Matrix", img: UIImage(named: "matrix")!)
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       /* OPCION 1
         if isSearching {
            return filterMovies.count
        }else{
            return listMovies.count
        }*/
        
        //OPCION 2
        return !isSearching ? listMovies.count : filterMovies.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! TableViewCellCustom
        
        if isSearching {
            myCell.imgMovie.image = filterMovies[indexPath.row].img
            myCell.lblTitleMovie.text = filterMovies[indexPath.row].title
        }else{
            myCell.imgMovie.image = listMovies[indexPath.row].img
            myCell.lblTitleMovie.text = listMovies[indexPath.row].title
        }
        
        return myCell
    }
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        /* FILTRADO SOLO POR EL PRINCIPIO DEL TÍTULO
        filterMovies = listMovies.filter({$0.title.prefix(searchText.count) == searchText})
         */
        
        //FILTRADO POR CUALQUIER CONTENIDO DEL TÍTULO
        //filterMovies = listMovies.filter({$0.title.lowercased().contains(searchText.lowercased())})
        
        filterMovies = listMovies.filter({ (movie) -> Bool in
            return movie.title.lowercased().contains(searchText.lowercased())
        })
        
        isSearching = searchText != "" ? true : false

        tableView.reloadData()
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        searchBar.delegate = self
        searchBar.placeholder = "Introduce película a buscar"
    }


}

