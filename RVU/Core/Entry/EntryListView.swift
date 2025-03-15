//
//  EntryListView.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import SwiftUI
import SwiftData

struct EntryRowView: View {
    let entry: Entry
    
    var body: some View {
        VStack(alignment: .leading) {
            if let cpt = entry.cpt {
                CPTRowView(cpt: cpt)
                Text("Units: \(entry.units, specifier: "%.1f")")
                Text("Subtotal: :\(entry.total, specifier: "%.1f")")
            }
            
        }
    }
}


struct EntryListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \Entry.createDate) private var entries: [Entry]
    @State private var newEntry: Entry?
    var totalWRVU : Double {
         var total = 0.0
         for entry in entries {
             if entry.cpt != nil {
                 total += entry.total
             }
         }
         return total
     }
    var body: some View {
        List {
            Text("Total \(totalWRVU, specifier: "%.1f")").font(.title)
            ForEach(entries) { entry in
                NavigationLink(value: entry) {
                    EntryRowView(entry: entry)
                }
            }
        }
        .navigationDestination(for: Entry.self) { entry in
            EntryEditView(entry: entry)
        }
        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
                .sheet(item: $newEntry) { entry in
                    NavigationStack {
                        EntryEditView(entry: entry)
                            .navigationTitle("Entry Add")
                    }
                }
            }
        }
    }
    private func addItem() {
        let entry = Entry()
        modelContext.insert(entry)
        newEntry = entry
    }
  
}


#Preview {
    let dataInitializer = DataInitializer()
    
    NavigationStack {
        EntryListView()
            .navigationTitle("wRVUs")
    }
    .modelContainer(dataInitializer.container)
}
