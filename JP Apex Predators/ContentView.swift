//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    
    var body: some View {
        List(predators.apexPredators) { predators in
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
        }.preferredColorScheme(.dark)
            .scrollIndicators(.hidden)
    }
}

#Preview {
    ContentView()
}
