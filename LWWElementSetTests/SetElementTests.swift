//
//  SetElementTests.swift
//  LWWElementSetTests
//
//  Copyright © 2018 harry. All rights reserved.
//

import XCTest

@testable import LWWElementSet

class SetElementTests: XCTestCase {

    func testSetElementInitialisation() {
        let name = "harry"
        let timestamp = Date()
        let harry = SetElement(name: name, timestamp: timestamp)

        XCTAssertEqual(harry.name, name, "harry.name should be equal to \(name)")
        XCTAssertEqual(harry.timestamp, timestamp, "harry.timestamp should be equal to \(timestamp)")
    }

    func testTwoSetElementObjectHavingSameNameToBeEqual() {
        let harry1 = SetElement(name: "harry", timestamp: Date.init(timeIntervalSinceNow: 0))
        let harry2 = SetElement(name: "harry", timestamp: Date.init(timeIntervalSinceNow: 10));

        XCTAssert(harry1 == harry2, "harry1 must be equal to harry2")
    }

    func testTwoSetElementObjectHavingDifferentNameToBeNotEqual() {
        let harry = SetElement(name: "harry", timestamp: Date.init(timeIntervalSinceNow: 0))
        let garry = SetElement(name: "garry", timestamp: Date.init(timeIntervalSinceNow: 10));

        XCTAssertNotEqual(harry, garry, "harry should not be equal to garry")
    }

    func testTwoSetElementHavingSameNameToBeEqualIrrespectiveOfTimestamp() {
        let timestamp1 = Date()
        let timestamp2 = timestamp1.addingTimeInterval(10)
        let harry1 = SetElement(name: "harry", timestamp: timestamp1)
        var harry2 = SetElement(name: "harry", timestamp: timestamp1)

        XCTAssertEqual(harry1, harry2, "harry1 should be equal to harry2 irresppective of same timestamp")

        harry2 = SetElement(name: "harry", timestamp: timestamp2)

        XCTAssertEqual(harry1, harry2, "harry1 should be equal to harry2 irresppective of different timestamp")

    }

}
