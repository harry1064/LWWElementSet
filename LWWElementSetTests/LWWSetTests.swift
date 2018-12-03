//
//  LWWSetTests.swift
//  LWWElementSetTests
//
//  Copyright © 2018 harry. All rights reserved.
//

import XCTest

@testable import LWWElementSet

class LWWSetTests: XCTestCase {

    func testLWWSetInitialisation() {
        let set = LWWSet()
        XCTAssertTrue(set.listItems().count == 0, "Elements in set must be 0")
    }

    func testLWWSetAddElementWithSameName() {
        let timestamp = Date()
        let timestamp2 = timestamp.addingTimeInterval(10)
        var set = LWWSet()
        set.addElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.addElement(element: SetElement(name: "harry", timestamp: timestamp2))
        XCTAssertTrue(set.listItems().count == 1, "Elements in set must be 1")
        XCTAssertTrue(set.listItems()[0].timestamp == timestamp2, "timmestamp of element should be larger than the previous entry")
    }

    func testLWWSetAddElementWithDifferentName() {
        let timestamp = Date()
        var set = LWWSet()
        set.addElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.addElement(element: SetElement(name: "garry", timestamp: timestamp))
        XCTAssertTrue(set.listItems().count == 2, "Elements in set must be 2")
    }

    func testLWWSetRemoveElementWithSameName() {
        let timestamp = Date()
        let timestamp2 = timestamp.addingTimeInterval(10)
        var set = LWWSet()
        set.removeElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.removeElement(element: SetElement(name: "harry", timestamp: timestamp2))
        XCTAssertTrue(set.listItems().count == 0, "Elements in set must be 0")
    }

    func testLWWSetRemoveElementWithDifferentName() {
        let timestamp = Date()
        var set = LWWSet()
        set.removeElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.removeElement(element: SetElement(name: "garry", timestamp: timestamp))
        XCTAssertTrue(set.listItems().count == 0, "Elements in set must be 0")
    }

    func testLWWSetAddRemoveElementWithSameTimestamp() {
        let timestamp = Date()
        var set = LWWSet()
        set.addElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.removeElement(element: SetElement(name: "harry", timestamp: timestamp))
        XCTAssertTrue(set.listItems().count == 1, "Elements in set must be 1")
    }

    func testLWWSetAddRemoveElementWithRemoveTimestampGreaterThanAddTimestamp() {
        let timestamp = Date()
        let timestamp2 = timestamp.addingTimeInterval(10)
        var set = LWWSet()
        set.addElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.removeElement(element: SetElement(name: "harry", timestamp: timestamp2))
        XCTAssertTrue(set.listItems().count == 0, "Elements in set must be 0")
    }

    func testLWWSetAddRemoveElementWithRemoveTimestampLessThanAddTimestamp() {
        let timestamp = Date()
        let timestamp2 = timestamp.addingTimeInterval(-10)
        var set = LWWSet()
        set.addElement(element: SetElement(name: "harry", timestamp: timestamp))
        set.removeElement(element: SetElement(name: "harry", timestamp: timestamp2))
        XCTAssertTrue(set.listItems().count == 1, "Elements in set must be 1")
    }
}
