//
//  CPT.swift
//  RVU
//
//  Created by Conner Yoon on 3/15/25.
//

import Foundation
import SwiftData

struct CPT : Identifiable, Codable, Equatable, Hashable {
    var code : String = ""
    var mod : String  = ""
    var descript : String = ""
    var wRVU : Double = 0.0
    var id : String {
        code + mod
    }
    static let examples = [
        CPT(code:"63030", descript: "lumbar discectomy", wRVU: 14.0),
        CPT(code:"67891", descript: "made up thing", wRVU: 23.2)
    ]
}
