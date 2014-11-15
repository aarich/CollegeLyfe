//
//  Grocery.swift
//  CollegeLyfe
//
//  Created by Alex Rich on 11/14/14.
//  Copyright (c) 2014 Alex Rich and Jessica Szejer. All rights reserved.
//

import Foundation

class Grocery {
    var items: [(name: String, value: Double)]
    var totalToSpend: Double = 0.0
    var possibleCombos: [[(name: String, value: Int)]] = []
    
    
    init () {
        self.items = []
        self.totalToSpend = 0
        self.possibleCombos = []
    }
    
    init (items: [(name: String, value: Double)], totalToSpend: Double) {
        self.items = items
        self.totalToSpend = totalToSpend
        self.possibleCombos = []
    }
    
    func setSpendingLimit(newLimit: Double) {
        self.totalToSpend = newLimit
    }
    
    func addItem(newItem: String, val: Double) {
        self.items.append(name: newItem, value: val)
    }
    
    func removeItems() {
        items = []
    }
    
    func reset() {
        self.removeItems()
        totalToSpend = 0
        self.possibleCombos = []
    }
    
    func compute() {
        var list = self.generateCombos(items, totalToSpend: self.totalToSpend)
        self.possibleCombos = list
    }
    
    func generateCombos(items: [(name: String, value: Double)], totalToSpend: Double) -> [[(name: String, value: Int)]] {
        // Generates a list of tuples of the possible combinations one can get.
        if items.isEmpty {
            return []
        }
        var enough = false
        for (name, value) in items {
            if value <= Double(totalToSpend) {
                enough = true
                break
            }
        }
        if !enough {
            return []
        }
        
        var useit = self.generateCombos(items, totalToSpend: totalToSpend - items[0].value)
        var sliced = items
        sliced.removeAtIndex(0)
        let loseit = self.generateCombos(sliced, totalToSpend: totalToSpend)
        
        for var n = 0; n < useit.count; ++n {
            var found = false
            for var i = 0; i < useit[n].count; ++i {
                if useit[n][i].name == items[0].name {
                    useit[n][i].value += 1
                    found = true
                }
            }
            if !found {
                useit[n].append(name: items[0].name, value: 1)
            }
            
        }
        
        if useit.count == 0 {
            useit = [[(name:items[0].name, value: 1)]]
        }
        
        return useit + loseit
    }
    
}