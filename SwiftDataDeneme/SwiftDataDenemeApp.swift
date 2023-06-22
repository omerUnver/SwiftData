//
//  SwiftDataDenemeApp.swift
//  SwiftDataDeneme
//
//  Created by M.Ömer Ünver on 22.06.2023.
//

import SwiftUI

@main
struct SwiftDataDenemeApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [TestModel.self])
        }
    }
}
