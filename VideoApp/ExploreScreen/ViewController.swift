//
//  ViewController.swift
//  VideoApp
//
//  Created by Shubham Tunwal on 12/12/20.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{

    
    
    var videosList:[VideosJSONElement]?
    var videosListInstance:VideosDataAccessModel?


    
    @IBOutlet weak var categoriesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        videosList = []
        videosListInstance = VideosDataAccessModel()
        
        videosList = videosListInstance?.videosList
        categoriesTableView.dataSource = self
        categoriesTableView.delegate = self
        
        categoriesTableView.reloadData()
        
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  videosList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "categoriesCell") as! CategoriesVideoCell
        cell.videos = videosList![indexPath.row].nodes
        cell.position = indexPath.row
        cell.categoryTitle.text  = videosList![indexPath.row].title
        

        cell.videosCollectionView.reloadData()
        cell.sceneContext = self

        return cell
    }
    
    
   
    
}


//scaliblity
//object reusablity
