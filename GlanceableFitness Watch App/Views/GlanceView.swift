//
//  GlanceView.swift
//  GlanceableFitness Watch App
//
//  Created by francisco eduardo aramburo reyes on 22/11/25.
//

import SwiftUI

struct GlanceView: View {
    @ObservedObject var vm: GlanceVM
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        NavigationStack {
            VStack(spacing: 12) {

                // Time (glanceable)
                Text(vm.snapshot.time, style: .time)
                    .font(.system(.title2, design: .rounded).weight(.semibold))
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                    .foregroundStyle(.primary)
                    .accessibilityLabel("Time")
                    .accessibilityValue(Text(vm.snapshot.time, style: .time))
                    .padding(.top, 4)

                // Metrics Cards
                HStack(spacing: 10) {
                    NavigationLink {
                        HeartDetailView(bpm: vm.snapshot.heartBPM)
                    } label: {
                        MetricCard(
                            title: "Heart",
                            value: "\(vm.snapshot.heartBPM)",
                            unit: "bpm",
                            accessibilityHint: "Opens heart rate details"
                        )
                        .foregroundStyle(.white)
                    }
                    .buttonStyle(.plain)
                    .sensoryFeedback(.selection, trigger: vm.snapshot.heartBPM)

                    NavigationLink {
                        StepsDetailView(steps: vm.snapshot.steps)
                    } label: {
                        MetricCard(
                            title: "Steps",
                            value: "\(vm.snapshot.steps)",
                            unit: nil,
                            accessibilityHint: "Opens steps details"
                        )
                        .foregroundStyle(.white)
                    }
                    .buttonStyle(.plain)
                    .sensoryFeedback(.selection, trigger: vm.snapshot.steps)
                }
                .padding(.vertical, 4)

                // Refresh Button
                Button {
                    vm.refreshMock()
                } label: {
                    HStack(spacing: 4) {
                        Image(systemName: "arrow.clockwise")
                            .font(.system(.caption, design: .rounded).weight(.semibold))
                        Text("Refresh")
                            .font(.system(.caption, design: .rounded).weight(.medium))
                    }
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .controlSize(.small)
                .accessibilityHint("Simulates new sensor data")
                .padding(.top, 2)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 8)
            .containerBackground(for: .navigation) {
                scheme == .dark ? Color.black : Color.clear
            }
        }
    }
}

#Preview {
    GlanceView(vm: GlanceVM())
}
