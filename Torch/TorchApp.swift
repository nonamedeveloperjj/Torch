//
//  TorchApp.swift
//  Torch
//
//  Created by John Snow on 03/04/2023.
//

import SwiftUI
import Timeline

@main
struct TorchApp: App {
    var body: some Scene {
        WindowGroup {
            TimelineListAssembly().assemble()
        }
    }
}
