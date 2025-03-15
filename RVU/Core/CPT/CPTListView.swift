//
//  CPTListView.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import SwiftUI

struct CPTRowView: View {
    let cpt: CPT
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(cpt.code)
                Text(cpt.mod)
            }.font(.headline)
            HStack {
                Text(cpt.descript)
                Text("\(cpt.wRVU, specifier: "%.1f")")
            }.font(.subheadline)
        }
    }
}
struct CPTListView: View {
    @Environment(CPTManager.self) var cptManager
    
    var body: some View {
        List {
            Text("Count : \(cptManager.cpts.count)")
            ForEach(cptManager.cpts) { cpt in
                CPTRowView(cpt: cpt)
            }
        }
    }
}

#Preview {
    let cptManager = CPTManager()
    
    NavigationStack {
        CPTListView()
            .navigationTitle("CPTs")
    }
        .environment(cptManager)
}
