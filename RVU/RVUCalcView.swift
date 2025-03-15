////
////  RVUCalcView.swift
////  RVU
////
////  Created by Conner Yoon on 3/15/25.
////
//
//import SwiftUI
//class DataManager : ObservableObject {
//    @Published var entries : [Entry] = Entry.examples
//    var total : Double {
//        var total : Double = 0.0
//        for entry in entries {
//            total += entry.total
//        }
//        return total
//    }
//    
//}
//struct RVUCalcView: View {
//    @ObservedObject var data = DataManager()
//    var body: some View {
//        NavigationStack {
//            Text("Total RVU : \(data.total)")
//            RVUListView(entries: data.entries)
//                .navigationTitle("RVU Calculator")
//           
//        }
//    }
//}
//
//#Preview {
//    RVUCalcView()
//}
