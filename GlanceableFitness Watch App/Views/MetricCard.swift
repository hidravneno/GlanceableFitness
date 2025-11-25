//
//  MetricCard.swift
//  GlanceableFitness Watch App
//
//  Created by francisco eduardo aramburo reyes on 22/11/25.
//

import SwiftUI

struct MetricCard: View {
    let title: String
    let value: String
    let unit: String?
    let accessibilityHint: String

    var body: some View {
        VStack(spacing: 4) {
            Text(title)
                .font(.system(.caption2, design: .rounded).weight(.medium))
                .opacity(0.9)
                .textCase(.uppercase)
                .tracking(0.5)
            
            // Value - Most prominent
            Text(value)
                .font(.system(.title, design: .rounded).weight(.bold))
                .minimumScaleFactor(0.6)
                .lineLimit(1)
            
            // Unit
            if let unit {
                Text(unit)
                    .font(.system(.caption, design: .rounded).weight(.medium))
                    .opacity(0.85)
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: 85)
        .padding(.horizontal, 8)
        .padding(.vertical, 10)
        .background(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .fill(.ultraThinMaterial)
                .shadow(color: .black.opacity(0.15), radius: 4, x: 0, y: 2)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 16, style: .continuous)
                .strokeBorder(.white.opacity(0.2), lineWidth: 1)
        )
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(title) \(value) \(unit ?? "")")
        .accessibilityHint(accessibilityHint)
    }
}
