//
//  StepsDetailView.swift
//  GlanceableFitness Watch App
//
//  Created by francisco eduardo aramburo reyes on 22/11/25.
//

import SwiftUI

struct StepsDetailView: View {
    let steps: Int
    
    private var dailyGoal: Int { 10000 }
    private var progressPercentage: Double {
        min(Double(steps) / Double(dailyGoal), 1.0)
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Steps Icon
                Image(systemName: "figure.walk")
                    .font(.system(size: 40))
                    .foregroundStyle(.blue)
                
                // Steps Value
                VStack(spacing: 4) {
                    Text("\(steps)")
                        .font(.system(.largeTitle, design: .rounded).weight(.bold))
                        .foregroundStyle(.primary)
                    
                    Text("steps today")
                        .font(.system(.caption, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                
                // Progress Bar
                VStack(spacing: 6) {
                    GeometryReader { geometry in
                        ZStack(alignment: .leading) {
                            
                            // Background
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.tertiary)
                                .frame(height: 8)
                            
                            // Progress
                            RoundedRectangle(cornerRadius: 8)
                                .fill(.blue.gradient)
                                .frame(width: geometry.size.width * progressPercentage, height: 8)
                        }
                    }
                    .frame(height: 8)
                    
                    HStack {
                        Text("\(Int(progressPercentage * 100))%")
                            .font(.system(.caption2, design: .rounded).weight(.semibold))
                        Spacer()
                        Text("Goal: \(dailyGoal)")
                            .font(.system(.caption2, design: .rounded))
                            .foregroundStyle(.secondary)
                    }
                }
                .padding(.top, 4)
            }
            .padding()
        }
        .navigationTitle("Steps")
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityElement(children: .combine)
    }
}
