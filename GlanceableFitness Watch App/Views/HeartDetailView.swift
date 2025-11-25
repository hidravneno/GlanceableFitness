//
//  HeartDetailView.swift
//  GlanceableFitness Watch App
//
//  Created by francisco eduardo aramburo reyes on 22/11/25.
//

import SwiftUI

struct HeartDetailView: View {
    let bpm: Int
    
    private var heartRateCategory: (String, Color) {
        switch bpm {
        case ..<60: return ("Low", .blue)
        case 60..<100: return ("Normal", .green)
        case 100..<120: return ("Elevated", .orange)
        default: return ("High", .red)
        }
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                
                // Heart Icon with animation
                Image(systemName: "heart.fill")
                    .font(.system(size: 40))
                    .foregroundStyle(.red)
                    .symbolEffect(.pulse, options: .repeating)
                
                // BPM Value
                VStack(spacing: 4) {
                    Text("\(bpm)")
                        .font(.system(.largeTitle, design: .rounded).weight(.bold))
                        .foregroundStyle(.primary)
                    
                    Text("beats per minute")
                        .font(.system(.caption, design: .rounded))
                        .foregroundStyle(.secondary)
                }
                
                // Status Badge
                Text(heartRateCategory.0)
                    .font(.system(.footnote, design: .rounded).weight(.semibold))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 6)
                    .background(
                        Capsule()
                            .fill(heartRateCategory.1.gradient)
                    )
            }
            .padding()
        }
        .navigationTitle("Heart Rate")
        .navigationBarTitleDisplayMode(.inline)
        .accessibilityElement(children: .combine)
    }
}
