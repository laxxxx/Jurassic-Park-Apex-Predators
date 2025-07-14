//
//  ApexPredatorModel.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable {
    var id: Int
    var name: String
    var type: ApexPredatorType
    var latitude: Double
    var longitude: Double
    var movies: [String]
    var movieScenes: [MovieScene]
    var link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable {
        var id: Int
        var movie: String
        var sceneDescription: String
    }
    
    enum ApexPredatorType: String, Decodable {
        case land
        case air
        case sea
        
        var backgroundColor: Color {
            switch self {
            case .land:
                return .brown
            case .air:
                return .teal
            case .sea:
                return .blue
            }
        }
    }
}
