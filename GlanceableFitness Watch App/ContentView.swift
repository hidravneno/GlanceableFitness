//
//  ContentView.swift
//  GlanceableFitness Watch App
//
//  Created by francisco eduardo aramburo reyes on 22/11/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = GlanceVM()
    
    var body: some View {
        VStack {
            Text(viewModel.snapshot.time, style: .time)
                .font(.system(size: 16))
                .opacity(0.8)
            
            Spacer()
        }
        
        //Steps
        HStack(spacing: 8) {
                        Image(systemName: "figure.walk")
                            .font(.system(size: 24))
                        Text("\(viewModel.snapshot.steps)")
                            .font(.system(size: 48, weight: .bold))
                    }
                    Spacer()
        
        
        //Heart (BMP)
        HStack(spacing: 8) {
                        Image(systemName: "heart.fill")
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                        Text("\(viewModel.snapshot.heartBPM) BPM")
                            .font(.system(size: 20, weight: .semibold))
                    }
        Spacer()

        
        
    
    
        .padding([.leading, .trailing, .bottom])
    }
}

#Preview {
    ContentView()
}
