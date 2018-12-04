//
//  main.swift
//  LWWSetExample
//
//  Created by Ravi Prakash on 12/4/18.
//  Copyright © 2018 harry. All rights reserved.
//

import Foundation
import LWWElementSet

let timestamp1 = Date()
let timestamp2 = timestamp1.addingTimeInterval(5)
let timestamp3 = timestamp1.addingTimeInterval(10)
let timestamp4 = timestamp1.addingTimeInterval(12)

var bag = LWWSet()

// adding element
bag.addElement(element: SetElement(name: "apple", timestamp: timestamp2))
bag.removeElement(element: SetElement(name: "apple", timestamp: timestamp3))
bag.addElement(element: SetElement(name: "apple", timestamp: timestamp4))
bag.removeElement(element: SetElement(name: "apple", timestamp: timestamp3))


print("=======================START=========================")
print("timestamp1 = \(timestamp1)")
print("timestamp2 = \(timestamp2)")
print("timestamp3 = \(timestamp3)")
print("timestamp4 = \(timestamp4)")
print("\nItem in bag: \n")
print(bag.listItems())

