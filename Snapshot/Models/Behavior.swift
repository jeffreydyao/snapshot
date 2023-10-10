//
//  Behavior.swift
//  Snapshot
//
//  Created by Jeffrey Yao on 10/10/2023.
//

import Foundation

/**
 A behavior logged by a user.
 */
struct Behavior: Identifiable, Hashable {
    /**
     A unique identifier for the instance of the logged behavior.
     */
    let id = UUID()
    /**
     The name of the behavior.
     ## Example
     Eat food
     */
    var name: String
    /**
     An optional note providing extra details about the behavior.
     ## Example
     200g steak w/ a glass of water
     */
    var note: String?
    /**
     The time at which the behavior was logged.
     */
    var timestamp: Date
}
