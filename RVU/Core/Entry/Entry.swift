//
//  Entry.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import Foundation
import SwiftData

@Model final
class Entry : Identifiable {
    var cpt : CPT?
    var units : Double = 0.0
    var id : UUID = UUID()
    var createDate = Date()
    
    var total : Double {
        guard let cpt else { return 0 }
        return units * cpt.wRVU
    }
    
    init(cpt: CPT = CPT(), units: Double = 1.0, id: UUID = UUID()) {
        self.cpt = cpt
        self.units = units
        self.id = id
    }
    static let examples = [
        Entry(cpt: CPT.examples[0], units: 2),
        Entry(cpt: CPT.examples[1], units: 1)
    ]
}
