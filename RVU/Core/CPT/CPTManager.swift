//
//  CPTManager.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import Foundation

@Observable
class CPTManager {
    var cpts: [CPT] = []
    var searchText = ""
    var filteredCPTs: [CPT] {
        if searchText.isEmpty {
            return cpts
        } else {
            return cpts.filter{
                $0.code.localizedStandardContains(searchText) ||
                $0.descript.localizedStandardContains(searchText)
            }
        }
    }
    init() {
        Task{
            await getData()
        }
    }
    
    private func getData() async {
        let filename =  "data"
        do {
            cpts = try await CSVManager.getDataFrom(fileName: filename)
            print("Retrieved \(cpts.count) entries")
        }
        catch {
            print("Could not find file '\(filename)'")
        }
    }
}
