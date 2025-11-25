//
//  GlanceVM.swift
//  GlanceableFitness
//
//  Created by francisco eduardo aramburo reyes on 22/11/25.
//

import Foundation
import Combine
import SwiftUI

@MainActor
final class GlanceVM: ObservableObject {
    @Published var snapshot = FitnessSnapshot(time: .now, heartBPM: 72, steps: 1240)

    func refreshMock() {
        let delta = Int.random(in: -3...3)
        let stepDelta = Int.random(in: 10...60)
        snapshot = FitnessSnapshot(
            time: .now,
            heartBPM: max(48, min(180, snapshot.heartBPM + delta)),
            steps: max(0, snapshot.steps + stepDelta)
        )
    }
}
