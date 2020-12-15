


//This is Serializer class

import Foundation

class VideosJSONElement: Codable {
    let title: String
    let nodes: [Node]

    init(title: String, nodes: [Node]) {
        self.title = title
        self.nodes = nodes
    }
    
    
  
    
    
    
}

class Node: Codable {
    let video: Video

    init(video: Video) {
        self.video = video
    }
}

class Video: Codable {
    let encodeURL: String

    enum CodingKeys: String, CodingKey {
        case encodeURL = "encodeUrl"
    }

    init(encodeURL: String) {
        self.encodeURL = encodeURL
    }
}

typealias VideosJSON = [VideosJSONElement]
