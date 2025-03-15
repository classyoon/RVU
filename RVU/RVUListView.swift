////
////  RVUListView.swift
////  RVU
////
////  Created by Conner Yoon on 3/15/25.
////
//
//import SwiftUI
//
//struct RVUListView: View {
//    
//    @State var entries : [Entry]
//    var body: some View {
//        NavigationStack{
//            
//            List{
//                ForEach($entries) { entry in
//                    EntryView(entry: entry)
//                }.onDelete(perform: deleteItems)
//            }.toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    EditButton()
//                }
//                ToolbarItem {
//                    Button(action: addItem) {
//                        Label("Add Item", systemImage: "plus")
//                    }
//                }
//            }
//        }
//    }
//    private func addItem() {
//        let newItem = Entry()
//        withAnimation {
//            entries.insert(newItem, at: 0)
//        }
//    }
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                entries.remove(at: index)
//            }
//        }
//    }
//}
//
//#Preview {
//    RVUListView(entries: Entry.examples)
//}
