//
//  BehaviorViewModelTests.swift
//  SnapshotTests
//
//  Created by Jeffrey Yao on 11/10/2023.
//

import XCTest
@testable import Snapshot

final class BehaviorViewModelTests: XCTestCase {
    
    var viewModel: BehaviorViewModel!

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = BehaviorViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
        super.tearDown()
    }
    
    func testCreateBehavior() {
        let date = Date()
        let behaviorName = "Eat food"
        
        viewModel.createBehavior(name: behaviorName, date: date)
        
        let behaviorsOnDate = viewModel.getBehaviors(for: date)
        XCTAssertNotNil(behaviorsOnDate)
        XCTAssertEqual(behaviorsOnDate?.first?.name, behaviorName)
    }
    
    func testUpdateBehavior() {
        let date = Date()
        let behaviorName = "Eat food"
        
        viewModel.createBehavior(name: behaviorName, date: date)
        let note = "200g steak"
        viewModel.updateBehavior(date: date, index: 0, note: note)
        
        let updatedBehavior = viewModel.getBehavior(for: date, index: 0);
        XCTAssertNotNil(updatedBehavior)
        XCTAssertEqual(updatedBehavior?.note, note)
    }
    
    func testDeleteBehavior() {
        let date = Date()
        let behaviorName = "Eat food"
        
        viewModel.createBehavior(name: behaviorName, date: date)
        viewModel.deleteBehavior(date: date, indexSet: [0])
        let behaviorsOnDate = viewModel.getBehaviors(for: date)
        XCTAssertNotNil(behaviorsOnDate)
        XCTAssertEqual(behaviorsOnDate?.count, 0)
    }
}
