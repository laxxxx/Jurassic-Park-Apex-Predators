//
//  PredatorDetailView.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 15/07/25.
//

import SwiftUI

struct PredatorDetailView: View {
    let predator: ApexPredator
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                ZStack(alignment: .bottomTrailing) {
                    //Background image
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFit()
                    
                    //predator image
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black, radius: 7)
                        .offset(y: 20)
                }
                
                VStack(alignment: .leading) {
                    //Predator name
                    Text(predator.name)
                        .font(.largeTitle)
                    
                    //map
                    
                    //appearance
                    Text("Appears in:")
                        .font(.title2)
                    
                    ForEach(predator.movies, id: \.self) { movie in
                        Text("•" + movie)
                            .font(.subheadline)
                    }
                    
                    //movie moments
                    Text("Movie Moments:")
                        .font(.title)
                        .padding(.top, 15)
                    
                    ForEach(predator.movieScenes) { scene in
                        Text(scene.movie)
                            .padding(.vertical, 1)
                        
                        Text(scene.sceneDescription)
                            .padding(.bottom, 15)
                    }
                    
                    //link
                    Text("Read More :")
                        .font(.caption)
                    
                    Link(predator.link, destination: URL(string: predator.link)!)
                        .font(.caption)
                        .foregroundStyle(.blue)
                    
                    
                }
                .padding()
                .padding(.bottom)
                .frame(width: geo.size.width, alignment: .leading)
                
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PredatorDetailView(predator: Predators().allApexPredators[2])
        .preferredColorScheme(.light)
}
