//
//  LWWSet.swift
//  LWWElementSet
//
//  Copyright © 2018 harry. All rights reserved.
//

import Foundation

public struct LWWSet {
    private var addSet: Set<SetElement> = []
    private var removeSet: Set<SetElement> = []

    public init() {}

    private func addToSet( set: inout Set<SetElement>, element: SetElement) {
        if let oldElement = self.find(name: element.name, in:set) {
            if element.timestamp > oldElement.timestamp {
                set.remove(oldElement)
            }
        }
        set.insert(element)
    }

    private func find(name: String, in set: Set<SetElement>) -> SetElement? {
        let element = SetElement(name: name)
        if let index = set.firstIndex(of: element) {
            return set[index]
        }
        return nil
    }

    public mutating func addElement(element: SetElement) {
        self.addToSet(set: &addSet, element: element)
    }

    public mutating func removeElement(element: SetElement) {
        self.addToSet(set: &removeSet, element: element)
    }

    public func query(name: String) -> Bool {
        let elementInAddSet = self.find(name: name, in: addSet)
        let elementInRemoveSet = self.find(name: name, in: removeSet)
        if elementInAddSet != nil && elementInRemoveSet != nil {
            if elementInAddSet!.timestamp >= elementInRemoveSet!.timestamp {
                return true
            } else {
                return false
            }
        } else if elementInAddSet != nil && elementInRemoveSet == nil {
            return true
        } else {
            return false
        }
    }

    public func listItems() -> [SetElement] {
        var elements: [SetElement] = []

        for element in addSet {
            if query(name: element.name) {
                elements.append(element)
            }
        }
        return elements
    }
}

