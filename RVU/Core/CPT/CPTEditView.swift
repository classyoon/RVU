//
//  CPTEditView.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import SwiftUI

struct CPTEditView: View {
    @Binding var cpt: CPT

    var body: some View {
        Form {
            Section("Code"){
                TextField("code", text: $cpt.code)
            }
            Section("Mod") {
                TextField("mod", text: $cpt.mod)
            }
            Section("Description"){
                TextField("description", text: $cpt.descript)
            }
            Section("wRVU"){
                TextField("wRVU", value: $cpt.wRVU, formatter: formatter)
            }
        }
    }
}

#Preview {
    @Previewable @State var cpt = CPT.examples[0]
    NavigationStack {
        CPTEditView(cpt: $cpt)
            .navigationTitle("CPT Edit")
    }
}
