//
//  Predators.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import Foundation

class Predators {
    var apexPredators = [ApexPredator]()
    
    init() {
        decodeApexPredators()
    }
    
    func decodeApexPredators() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                apexPredators = try decoder.decode([ApexPredator].self, from: data)
            } catch {
                print("error decoding json data \(error.localizedDescription)")
            }
        }
    }
}
