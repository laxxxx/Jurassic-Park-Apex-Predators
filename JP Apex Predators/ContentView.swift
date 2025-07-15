//
//  ContentView.swift
//  JP Apex Predators
//
//  Created by Sree Lakshman on 14/07/25.
//

import SwiftUI

struct ContentView: View {
    
    let predators = Predators()
    @State var searchPredators = ""
    @State var isAlphabetical = false
    @State var currentSelection = ApexPredatorType.all
    
    var filteredPredators: [ApexPredator] {
        predators.filter(by: currentSelection)
        
        predators.sort(by: isAlphabetical)
        
        return predators.search(for: searchPredators)
    }
    
    var body: some View {
        NavigationStack {
            List(filteredPredators) { predators in
                NavigationLink {
                    PredatorDetailView(predator: predators)
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
            .searchable(text: $searchPredators)
            .autocorrectionDisabled()
            .animation(.default, value: searchPredators)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        withAnimation {
                            isAlphabetical.toggle()
                        }
                    } label: {
                        isAlphabetical ? Image(systemName: "film") : Image(systemName: "textformat")
                    }
                    .symbolEffect(.bounce, value: isAlphabetical)
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Picker("Filter", selection: $currentSelection.animation()) {
                            ForEach(ApexPredatorType.allCases) { type in
                                Label(type.rawValue.capitalized, systemImage: type.icon)
                            }
                        }
                    } label : {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
