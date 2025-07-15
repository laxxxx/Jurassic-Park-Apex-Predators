//
//  Predators.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import Foundation

class Predators {
    var apexPredators = [ApexPredator]()
    var allApexPredators: [ApexPredator] = [] //master list
    
    init() {
        decodeApexPredators()
    }
    
    func decodeApexPredators() {
        if let url = Bundle.main.url(forResource: "jpapexpredators", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                allApexPredators = try decoder.decode([ApexPredator].self, from: data)
                apexPredators = allApexPredators
            } catch {
                print("error decoding json data \(error.localizedDescription)")
            }
        }
    }
    
    func search(for predators: String) -> [ApexPredator] {
        guard !predators.isEmpty else {
            return self.apexPredators
        }
        
        return self.apexPredators.filter {
            $0.name.localizedCaseInsensitiveContains(predators)
        }
    }
    
    func sort(by alphabetical: Bool) {
        apexPredators.sort { predator1, predator2 in
            if alphabetical {
                predator1.name < predator2.name
            } else {
                predator1.id < predator2.id
            }
        }
    }
    
    func filter(by type: ApexPredatorType) {
        if type == .all {
            apexPredators = allApexPredators
        } else {
            apexPredators = allApexPredators.filter { $0.type == type }
        }
    }
}
