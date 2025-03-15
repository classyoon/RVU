////
////  EntryView.swift
////  RVU
////
////  Created by Conner Yoon on 3/15/25.
////
//
//import SwiftUI
//
///*
// code    mod    descript    wRVU
// 0384    TC    Cone beam ct capture tmj    0.00
// D0384    26    Cone beam ct capture tmj    0.00
// D0385        Max mri image capture    0.00
// D0385    TC    Max mri image capture    0.00
// D0385    26    Max mri image capture    0.00
// */
//
//
//struct EntryView: View {
//    @Binding var entry : Entry
//    var body: some View {
//        HStack{
//            TextField("Code", text: $entry.cpt.code)
//            TextField("Input", value: $entry.units, format: .number)
//                        .padding()
//                        .keyboardType(.decimalPad)
//      
//            Text("Total: \(entry.total, specifier: "%.1f")")
//        }
//    }
//}
//
//#Preview {
//    EntryView(entry: .constant(Entry.examples.first!))
//}
