//
//  Behavior.swift
//  Snapshot
//
//  Created by Jeffrey Yao on 10/10/2023.
//

import Foundation

/**
 Represents a behavior with a name and a timestamp.
 */
struct Behavior: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var timestamp: Date
}
