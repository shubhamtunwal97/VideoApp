// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let videosJSON = try? newJSONDecoder().decode(VideosJSON.self, from: jsonData)


//This is Serializer class

import Foundation

// MARK: - VideosJSONElement
class VideosJSONElement: Codable {
    let title: String
    let nodes: [Node]

    init(title: String, nodes: [Node]) {
        self.title = title
        self.nodes = nodes
    }
    
    
  
    
    
    
}

// MARK: - Node
class Node: Codable {
    let video: Video

    init(video: Video) {
        self.video = video
    }
}

// MARK: - Video
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
