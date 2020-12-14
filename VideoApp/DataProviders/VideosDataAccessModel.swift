//
//  VideosDataAccessModel.swift
//  VideoApp
//
//  Created by Shubham Tunwal on 12/12/20.
//

import Foundation

class VideosDataAccessModel:NSObject{
    
    var videosList:[VideosJSONElement]?

    
    override init() {
        do {
            let url = Bundle.main.url(forResource: "assignment", withExtension: "json")!
            let data = try Data(contentsOf: url)
            videosList = try JSONDecoder().decode([VideosJSONElement].self, from: data)
            
        }catch  {
            
            print("Unexpected error: \(error).")
        }
    }
    
    
    func getListByTitle(title:String) -> [Node]{
        var nodes:[Node] = []
        
        for i in videosList!{
            if(i.title == title){
                nodes = i.nodes
            }
        }
        
        
        return nodes
        
    }
    
   
}
