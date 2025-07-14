//
//  ApexPredatorModel.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import Foundation

struct ApexPredator: Decodable {
    var id: Int
    var name: String
    var type: String
    var latitude: Double
    var longitude: Double
    var movies: [String]
    var movieScenes: [MovieScene]
    var link: String
}

struct MovieScene: Decodable {
    var id: Int
    var movie: String
    var sceneDescription: String
}
