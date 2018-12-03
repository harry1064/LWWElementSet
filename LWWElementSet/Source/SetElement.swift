//
//  SetElement.swift
//  LWWElementSet
//
//  Copyright © 2018 harry. All rights reserved.
//

import Foundation

public struct SetElement: Hashable {
    var name: String
    var timestamp: Date

    public var hashValue: Int {
        get {
            return self.name.hashValue
        }
    }

    init(name: String, timestamp: Date = Date()) {
        self.name = name
        self.timestamp = timestamp
    }

    public static func == (lhs: SetElement, rhs: SetElement) -> Bool {
        return lhs.name == rhs.name
    }

}
