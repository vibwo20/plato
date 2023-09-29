//
//  PlatoAppApp.swift
//  PlatoApp
//
//  Created by Lyvia Martins on 13/09/23.
//

import SwiftUI

@main
struct PlatoAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PostViewModel())
        }
    }
}
