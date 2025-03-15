//
//  RVUApp.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import SwiftUI
import SwiftData

let formatter: NumberFormatter = {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.maximumFractionDigits = 1
    return formatter
}()

@MainActor
@Observable
class DataInitializer {
    let config: ModelConfiguration
    let container: ModelContainer
    let isInMemory: Bool
    
    init(isInMemory: Bool = true) {
        self.isInMemory = isInMemory
        self.config = ModelConfiguration(isStoredInMemoryOnly: isInMemory)
        self.container = try! ModelContainer(for: Entry.self, configurations: config)
        Task {
            await loadData()
        }
    }
    @MainActor
    func loadData() async {
        if isInMemory {
            for entry in Entry.examples {
                container.mainContext.insert(entry)
            }
        }
    }
}

@main
struct RVUApp: App {
    @State var dataInitializer = DataInitializer(isInMemory: false)
    var cptManager = CPTManager()
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                EntryListView()
                    .navigationTitle("wRVU")
            }
        }
        .modelContainer(dataInitializer.container)
        .environment(dataInitializer)
        .environment(cptManager)
    }
}
