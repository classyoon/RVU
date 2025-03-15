//
//  CPTPickerView.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import SwiftUI
import SwiftData

extension View {
    func captioned(with caption: String) -> some View{
        VStack(alignment: .leading, spacing: 4) {
            Text(caption)
                .font(.callout)
                .foregroundStyle(.secondary)
            self
        }
    }
}

struct EntryEditView: View {
    @Bindable var entry: Entry
    @Environment(\.modelContext) private var modelContext
    @Environment(CPTManager.self) var cptManager
    @Environment(\.dismiss) var dismiss
    
    @State private var searchText = ""
    @State var selectedCPT: CPT?
    @State private var numberOfUnits: Double = 1.0
    
    var body: some View {
        VStack {
            Group {
                Text("Selected CPT: \(selectedCPT?.code ?? "None")")
                    .font(.title2)
                    .padding()
                TextField("CPT Code", text: $searchText)
                    .textFieldStyle(.roundedBorder)
                    .onChange(of: searchText) { oldValue, newValue in
                        cptManager.searchText = newValue
                    }
                    .captioned(with: "cpt code or description")
                    .padding(.horizontal)
                TextField("Number of units", value: $numberOfUnits, formatter: formatter)
                    .textFieldStyle(.roundedBorder)
                    .captioned(with: "number of units")
                    .padding(.horizontal)
            }
            .onAppear {
                selectedCPT = entry.cpt
                searchText = entry.cpt?.code ?? ""
                numberOfUnits = entry.units
            }
            List {
                
                ForEach(cptManager.filteredCPTs) { cpt in
                    HStack {
                        CPTRowView(cpt: cpt)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .padding(8)
                    .background {
                        Color.green.opacity(cpt == selectedCPT ? 0.1 : 0.0)
                    }
                    .onTapGesture {
                        selectedCPT = cpt
                    }
                    .tag(cpt.id)
                }
            }
        }            .background {
            Color.blue.opacity(0.1)
        }

        .toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button {
                    entry.cpt = selectedCPT
                    entry.units = numberOfUnits
                    dismiss()
                } label: {
                    Text("Done")
                }
            }
            ToolbarItem(placement: .secondaryAction) {
                Button {
                    modelContext.delete(entry)
                    dismiss()
                } label: {
                    Text("Delete")
                }
            }
        }
    }
}

#Preview {
    @Previewable @State var entry = Entry.examples[0]
    let cptManager = CPTManager()
    
    NavigationStack {
        VStack {
            EntryEditView(entry: entry)
        }
    }
        .modelContainer(for: Entry.self, inMemory: true)
        .environment(cptManager)
}
