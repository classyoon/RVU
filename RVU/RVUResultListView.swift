//
//  RVUResultListView.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import SwiftUI

struct RVUResultListView: View {
    var entries : [Entry]
    var body: some View {
        NavigationStack {
            List{
                ForEach(entries) { entry in
                    
//                    RVUResultView(result: RVUResult(entry: entry))
                }
            }
        }
    }
}

#Preview {
    RVUResultListView(entries: Entry.examples)
}
