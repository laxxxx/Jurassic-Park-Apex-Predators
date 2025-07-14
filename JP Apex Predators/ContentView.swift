//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    @State var searchText = ""
    
    var filteredPredators: [ApexPredator] {
        guard !searchText.isEmpty else {
            return predators.apexPredators
        }
        
        return predators.apexPredators.filter {
            $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPredators) { predators in
                NavigationLink {
                    Image(predators.image)
                        .resizable()
                        .scaledToFit()
                } label: {
                    HStack {
                        //predator image
                        Image(predators.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .shadow(color: .white, radius: 1)
                        
                        VStack(alignment: .leading) {
                            //name
                            Text(predators.name)
                                .fontWeight(.bold)
                            
                            //type
                            Text(predators.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predators.type.backgroundColor)
                                .clipShape(.capsule)
                        }
                        .padding()
                        
                    }
                }
            }
            .scrollIndicators(.hidden)
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
