//
//  BehaviorViewModel.swift
//  Snapshot
//
//  Created by Jeffrey Yao on 10/10/2023.
//

import Foundation

/**
 Responsible for managing behaviors logged by users within Snapshot.
 Provides functionality to create, read, delete and update behaviors safely.
 */
class BehaviorViewModel: ObservableObject {
    @Published var behaviors: [Date: [Behavior]] = [:]
    
    /**
     Normalizes an exact Date struct to a Date representing the original date, but
     with the time set to midnight of the local timezone. Used to generate the key for
     a day in the `behaviors` dictionary.
     */
    private func normalize(date: Date) -> Date? {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: date)
        return calendar.date(from: components)
    }
    
    private func performAction(on date: Date, action: (Date) -> Void) {
        guard let normalizedDate = normalize(date: date) else {
            print("Error: Failed to normalize date \(date)")
            return
        }
        action(normalizedDate)
    }
    
    /**
     Creates a new behavior in a given date.
     */
    func createBehavior(name: String, date: Date) {
        performAction(on: date) { normalizedDate in
            let newBehavior = Behavior(name: name, timestamp: date)
            behaviors[normalizedDate, default: []].append(newBehavior)
        }
    }
    
    /**
     Deletes a behavior from a date.
     */
    func deleteBehavior(date: Date, indexSet: IndexSet) {
        performAction(on: date) { normalizedDate in
            behaviors[normalizedDate]?.remove(atOffsets: indexSet)
        }
    }
    
    /**
     Updates a behavior from a date with a new value.
     */
    func updateBehavior(date: Date, index: Int, name: String? = nil, note: String? = nil, timestamp: Date? = nil) {
        performAction(on: date) { normalizedDate in
            guard var behaviorsOnDate = behaviors[normalizedDate] else {
                return
            }
            
            if let newName = name {
                behaviorsOnDate[index].name = newName
            }
            
            if let newNote = note {
                behaviorsOnDate[index].note = newNote
            }
            
            if let newTimestamp = timestamp {
                behaviorsOnDate[index].timestamp = newTimestamp
            }
            
            behaviors[normalizedDate] = behaviorsOnDate
        }
    }

    /**
     Returns all behaviors for a given date.
     */
    func getBehaviors(for date: Date) -> [Behavior]? {
        return normalize(date: date).flatMap { normalizedDate in
                return behaviors[normalizedDate]
        }
    }
    
    /**
     Returns a specific behavior for a given date.
     */
    func getBehavior(for date: Date, index: Int) -> Behavior? {
        return getBehaviors(for: date)?[index]
    }
}
